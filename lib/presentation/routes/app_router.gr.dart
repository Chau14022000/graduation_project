// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../../domain/entities/my_home/home/device_entities.dart' as _i16;
import '../../domain/entities/my_home/home/room_entities.dart' as _i18;
import '../../domain/entities/my_home/routines/routines_entities.dart' as _i17;
import '../feature/add_device/add_device_to_room.dart/add_device_to_room_page.dart'
    as _i13;
import '../feature/add_device/config_wifi/config_wifi_page.dart' as _i4;
import '../feature/add_device/list_device/list_device_page.dart' as _i12;
import '../feature/add_room/add_room_page.dart' as _i5;
import '../feature/create_routines_page.dart/create_routines_page.dart' as _i6;
import '../feature/device/device_page.dart' as _i9;
import '../feature/devices/devices_page.dart' as _i10;
import '../feature/edit_profile/edit_profile_page.dart' as _i7;
import '../feature/login/login_page.dart' as _i2;
import '../feature/my_home/my_home_page.dart' as _i8;
import '../feature/register/register_page.dart' as _i3;
import '../feature/room/room_page.dart' as _i11;
import '../feature/splash/splash_page.dart' as _i1;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterPage());
    },
    ConfigWifiRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ConfigWifiPage());
    },
    AddRoomRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AddRoomPage());
    },
    CreateRoutinesRoute.name: (routeData) {
      final args = routeData.argsAs<CreateRoutinesRouteArgs>(
          orElse: () => const CreateRoutinesRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.CreateRoutinesPage(
              deviceEntities: args.deviceEntities,
              routine: args.routine,
              key: args.key));
    },
    EditProfileRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.EditProfilePage());
    },
    MyHomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.MyHomePage());
    },
    DeviceRoute.name: (routeData) {
      final args = routeData.argsAs<DeviceRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.DevicePage(token: args.token, key: args.key));
    },
    DevicesRoute.name: (routeData) {
      final args = routeData.argsAs<DevicesRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.DevicesPage(listDevice: args.listDevice, key: args.key));
    },
    RoomRoute.name: (routeData) {
      final args = routeData.argsAs<RoomRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.RoomPage(roomEntities: args.roomEntities, key: args.key));
    },
    ListDeviceRoute.name: (routeData) {
      final args = routeData.argsAs<ListDeviceRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.ListDevicePage(
              listIdDevice: args.listIdDevice, key: args.key));
    },
    AddDeviceToRoomRoute.name: (routeData) {
      final args = routeData.argsAs<AddDeviceToRoomRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i13.AddDeviceToRoomPage(idDevice: args.idDevice, key: args.key));
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(SplashRoute.name, path: '/'),
        _i14.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i14.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i14.RouteConfig(ConfigWifiRoute.name, path: '/config-wifi-page'),
        _i14.RouteConfig(AddRoomRoute.name, path: '/add-room-page'),
        _i14.RouteConfig(CreateRoutinesRoute.name,
            path: '/create-routines-page'),
        _i14.RouteConfig(EditProfileRoute.name, path: '/edit-profile-page'),
        _i14.RouteConfig(MyHomeRoute.name, path: '/my-home-page'),
        _i14.RouteConfig(DeviceRoute.name, path: '/device-page'),
        _i14.RouteConfig(DevicesRoute.name, path: '/devices-page'),
        _i14.RouteConfig(RoomRoute.name, path: '/room-page'),
        _i14.RouteConfig(ListDeviceRoute.name, path: '/list-device-page'),
        _i14.RouteConfig(AddDeviceToRoomRoute.name,
            path: '/add-device-to-room-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i14.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.ConfigWifiPage]
class ConfigWifiRoute extends _i14.PageRouteInfo<void> {
  const ConfigWifiRoute()
      : super(ConfigWifiRoute.name, path: '/config-wifi-page');

  static const String name = 'ConfigWifiRoute';
}

/// generated route for
/// [_i5.AddRoomPage]
class AddRoomRoute extends _i14.PageRouteInfo<void> {
  const AddRoomRoute() : super(AddRoomRoute.name, path: '/add-room-page');

  static const String name = 'AddRoomRoute';
}

/// generated route for
/// [_i6.CreateRoutinesPage]
class CreateRoutinesRoute extends _i14.PageRouteInfo<CreateRoutinesRouteArgs> {
  CreateRoutinesRoute(
      {List<_i16.DeviceEntities>? deviceEntities,
      _i17.RoutinesEntities? routine,
      _i15.Key? key})
      : super(CreateRoutinesRoute.name,
            path: '/create-routines-page',
            args: CreateRoutinesRouteArgs(
                deviceEntities: deviceEntities, routine: routine, key: key));

  static const String name = 'CreateRoutinesRoute';
}

class CreateRoutinesRouteArgs {
  const CreateRoutinesRouteArgs({this.deviceEntities, this.routine, this.key});

  final List<_i16.DeviceEntities>? deviceEntities;

  final _i17.RoutinesEntities? routine;

  final _i15.Key? key;

  @override
  String toString() {
    return 'CreateRoutinesRouteArgs{deviceEntities: $deviceEntities, routine: $routine, key: $key}';
  }
}

/// generated route for
/// [_i7.EditProfilePage]
class EditProfileRoute extends _i14.PageRouteInfo<void> {
  const EditProfileRoute()
      : super(EditProfileRoute.name, path: '/edit-profile-page');

  static const String name = 'EditProfileRoute';
}

/// generated route for
/// [_i8.MyHomePage]
class MyHomeRoute extends _i14.PageRouteInfo<void> {
  const MyHomeRoute() : super(MyHomeRoute.name, path: '/my-home-page');

  static const String name = 'MyHomeRoute';
}

/// generated route for
/// [_i9.DevicePage]
class DeviceRoute extends _i14.PageRouteInfo<DeviceRouteArgs> {
  DeviceRoute({required String token, _i15.Key? key})
      : super(DeviceRoute.name,
            path: '/device-page',
            args: DeviceRouteArgs(token: token, key: key));

  static const String name = 'DeviceRoute';
}

class DeviceRouteArgs {
  const DeviceRouteArgs({required this.token, this.key});

  final String token;

  final _i15.Key? key;

  @override
  String toString() {
    return 'DeviceRouteArgs{token: $token, key: $key}';
  }
}

/// generated route for
/// [_i10.DevicesPage]
class DevicesRoute extends _i14.PageRouteInfo<DevicesRouteArgs> {
  DevicesRoute({required List<_i16.DeviceEntities?> listDevice, _i15.Key? key})
      : super(DevicesRoute.name,
            path: '/devices-page',
            args: DevicesRouteArgs(listDevice: listDevice, key: key));

  static const String name = 'DevicesRoute';
}

class DevicesRouteArgs {
  const DevicesRouteArgs({required this.listDevice, this.key});

  final List<_i16.DeviceEntities?> listDevice;

  final _i15.Key? key;

  @override
  String toString() {
    return 'DevicesRouteArgs{listDevice: $listDevice, key: $key}';
  }
}

/// generated route for
/// [_i11.RoomPage]
class RoomRoute extends _i14.PageRouteInfo<RoomRouteArgs> {
  RoomRoute({required _i18.RoomEntities roomEntities, _i15.Key? key})
      : super(RoomRoute.name,
            path: '/room-page',
            args: RoomRouteArgs(roomEntities: roomEntities, key: key));

  static const String name = 'RoomRoute';
}

class RoomRouteArgs {
  const RoomRouteArgs({required this.roomEntities, this.key});

  final _i18.RoomEntities roomEntities;

  final _i15.Key? key;

  @override
  String toString() {
    return 'RoomRouteArgs{roomEntities: $roomEntities, key: $key}';
  }
}

/// generated route for
/// [_i12.ListDevicePage]
class ListDeviceRoute extends _i14.PageRouteInfo<ListDeviceRouteArgs> {
  ListDeviceRoute({required List<String> listIdDevice, _i15.Key? key})
      : super(ListDeviceRoute.name,
            path: '/list-device-page',
            args: ListDeviceRouteArgs(listIdDevice: listIdDevice, key: key));

  static const String name = 'ListDeviceRoute';
}

class ListDeviceRouteArgs {
  const ListDeviceRouteArgs({required this.listIdDevice, this.key});

  final List<String> listIdDevice;

  final _i15.Key? key;

  @override
  String toString() {
    return 'ListDeviceRouteArgs{listIdDevice: $listIdDevice, key: $key}';
  }
}

/// generated route for
/// [_i13.AddDeviceToRoomPage]
class AddDeviceToRoomRoute
    extends _i14.PageRouteInfo<AddDeviceToRoomRouteArgs> {
  AddDeviceToRoomRoute({required String idDevice, _i15.Key? key})
      : super(AddDeviceToRoomRoute.name,
            path: '/add-device-to-room-page',
            args: AddDeviceToRoomRouteArgs(idDevice: idDevice, key: key));

  static const String name = 'AddDeviceToRoomRoute';
}

class AddDeviceToRoomRouteArgs {
  const AddDeviceToRoomRouteArgs({required this.idDevice, this.key});

  final String idDevice;

  final _i15.Key? key;

  @override
  String toString() {
    return 'AddDeviceToRoomRouteArgs{idDevice: $idDevice, key: $key}';
  }
}
