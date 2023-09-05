import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../models/device/device_model.dart';
import '../../models/room/room_model.dart';
import '../../models/routines/routines_model.dart';
import '../../models/routines/routines_request_model.dart';
import '../../models/user/user_model.dart';

class RealtimeService {
  RealtimeService? firebaseService;

  final refInstance = FirebaseDatabase.instance;

  //ACCOUNT
  Future<void> saveAccount(UserModel userModel) async {
    final ref = refInstance.ref('account/${userModel.id}');
    await ref.set(
      userModel.toJson(),
    );
  }

  Future<UserModel> getAccount() async {
    final id = FirebaseAuth.instance.currentUser?.uid;
    final snapShot = await refInstance.ref('account/$id').get();
    final map = snapShot.value as Map<dynamic, dynamic>;
    final user = UserModel.fromJson(
      Map<String, dynamic>.from(map),
    );
    return user;
  }

  Future<void> updateAccount(UserModel userModel) async {
    final id = FirebaseAuth.instance.currentUser?.uid;
    final ref = refInstance.ref(
      'account/$id',
    );
    await ref.update(
      {
        'avatar': userModel.avatar,
        'name': userModel.name,
        'phone': userModel.phone,
        'gender': userModel.gender,
      },
    );
  }

  //ROOM

  Future<void> addRoom(RoomModel roomModel) async {
    final id = FirebaseAuth.instance.currentUser?.uid;

    final ref = refInstance.ref('account/$id/rooms/').push();
    await ref.set(
      roomModel.toJson(),
    );
  }

  Future<void> updateRoom(RoomModel roomModel) async {
    final id = FirebaseAuth.instance.currentUser?.uid;
    final ref = refInstance.ref('account/$id/rooms/${roomModel.id}');
    await ref.set(
      roomModel.toJson(),
    );
  }

  Future<void> removeRoom(String id) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    final ref = refInstance.ref('account/$uid/rooms/$id');
    await ref.remove();
  }

  //DEVICE

  Stream<DatabaseEvent> streamDevices(String id) {
    final device = refInstance.ref('devices/$id').onValue;
    return device;
  }

  Future<void> updateStateDevice(DeviceModel deviceModel) async {
    final ref = refInstance.ref(
      'devices/${deviceModel.token}',
    );
    await ref.update(
      {
        'state': deviceModel.state,
        'name_device': deviceModel.nameDevice != ''
            ? deviceModel.nameDevice
            : deviceModel.token,
      },
    );
  }

  Future<void> addDevice(
    String deviceId,
    String room,
  ) async {
    final user = await getAccount();
    var devices = <String>[];
    var devicesRoom = <String>[];
    if (user.devices != null) {
      if (user.devices!.contains(deviceId)) {
        devices = user.devices!;
      } else {
        devices.addAll(user.devices!);
        devices.add(deviceId);
      }
    } else {
      devices = [deviceId];
    }
    final ref = refInstance.ref(
      'account/${user.id}/devices',
    );
    await ref.set(devices);
    if (room != '') {
      for (final element in user.rooms!) {
        if (element.id == room) {
          if (element.devices != null) {
            if (element.devices!.contains(deviceId)) {
              devicesRoom = user.devices!;
            } else {
              devicesRoom.addAll(user.devices!);
              devicesRoom.add(deviceId);
            }
          } else {
            devicesRoom = [deviceId];
          }
        }
      }
    }
    final refRoom = refInstance.ref(
      'account/${user.id}/rooms/$room/devices',
    );
    await refRoom.set(devicesRoom);
  }

  Future<void> upTimerDevice(
      RoutinesRequestModel routineModel, List<bool?> onOff) async {
    final list = [];
    list.addAll(onOff);
    for (final element in routineModel.routine.devices) {
      final stem = [...routineModel.routine.days];
      final ref = refInstance.ref(
        'devices/$element/timer/${routineModel.routine.timeStart}',
      );
      if (routineModel.timeBefore != '') {
        final refX = refInstance.ref(
          'devices/$element/timer/${routineModel.timeBefore}',
        );
        await refX.remove();
      }

      stem.add(routineModel.routine.status ? '21' : '22');
      stem.add(list.first! ? '10' : '11');
      list.removeAt(0);
      await ref.set(stem);
    }
  }

  Future<DeviceModel?> getDevice(String id) async {
    final snapshot = await refInstance.ref('devices/$id').get();
    final map = snapshot.value;
    if (map == null) {
      return null;
    }
    final device = DeviceModel.fromJson(
      Map<String, dynamic>.from(map as Map<dynamic, dynamic>),
    );
    return device;
  }

  //ROUTINES

  Stream<DatabaseEvent> streamRoutine(String id) {
    final routine = refInstance.ref('routines/$id').onValue;
    return routine;
  }

  Future<void> saveRoutines(RoutineModel routineModel) async {
    final user = await getAccount();
    final ref = refInstance
        .ref(
          'routines/',
        )
        .push();
    await ref.set(
      routineModel.toJson(),
    );
    final refX = refInstance.ref(
      'account/${user.id}/routines/',
    );
    final listRoutine = [];
    if (user.routines == null) {
      listRoutine.add(ref.key!);
    } else {
      listRoutine.addAll(user.routines!);
      if (!listRoutine.contains(ref.key!)) {
        listRoutine.add(ref.key!);
      }
    }
    await refX.set(listRoutine);
  }

  Future<void> updateRoutines(RoutineModel routineModel) async {
    final ref = refInstance.ref(
      'routines/${routineModel.id}',
    );
    await ref.set(
      routineModel.toJson(),
    );
  }

  Future<RoutineModel> getRoutines(String id) async {
    final snapshot = await refInstance.ref().child('routines/$id').get();
    final map = snapshot.value as Map<dynamic, dynamic>;
    final routines = RoutineModel.fromJson(
      Map<String, dynamic>.from(map),
    );
    routines.id = id;
    return routines;
  }

  Future<void> updateStateRoutines(
    RoutineModel routineModel,
    String id,
  ) async {
    final ref = refInstance.ref(
      'routines/${routineModel.id}',
    );
    await ref.update(
      {
        'status': routineModel.status,
      },
    );
    for (final element in routineModel.devices) {
      final stem = [];
      final device = await getDevice(element);
      for (final element in device!.timer!) {
        if (element.time == routineModel.timeStart) {
          stem.addAll(element.listTimer);
        }
      }
      if (routineModel.status) {
        stem[stem.length - 2] = '21';
      } else {
        stem[stem.length - 2] = '22';
      }
      final refX = refInstance.ref(
        'devices/$element/timer/${routineModel.timeStart}',
      );
      await refX.set(stem);
    }
  }

  Future<void> removeRoutine(RoutineModel routineModel) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    final refRoutine = refInstance.ref('routines/${routineModel.id}');
    await refRoutine.remove();

    final idRoutines = (await getAccount()).routines ?? [];

    idRoutines.removeWhere((element) => element == routineModel.id);

    final refRoutineAccount = refInstance.ref('account/$uid/routines');
    await refRoutineAccount.set(idRoutines);
    await Future.wait(
      routineModel.devices.map(
        (e) async {
          final ref = refInstance.ref(
            'devices/$e/timer/${routineModel.timeStart}',
          );
          await ref.remove();
        },
      ),
    );
  }

  Stream<DatabaseEvent> streamConnectedDevice(String id) {
    final device = refInstance.ref('devices/$id/connected').onValue;
    return device;
  }

  Future<int> getConnectedValue(String id) async {
    try {
      final result = await refInstance.ref('devices/$id/connected').once();
      return result.snapshot.value as int;
    } catch (e) {
      return 0;
    }
  }
}
