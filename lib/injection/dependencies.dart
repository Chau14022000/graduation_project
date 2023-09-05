import './app_modules.dart';
import './injector.dart';
import '../presentation/feature/add_device/add_device_to_room.dart/bloc/add_device_to_room_module.dart';
import '../presentation/feature/add_device/config_wifi/bloc/config_wifi_module.dart';
import '../presentation/feature/add_device/handle_connect/bloc/handle_connect_module.dart';
import '../presentation/feature/add_device/list_device/bloc/list_device_module.dart';
import '../presentation/feature/add_room/bloc/add_room_module.dart';
import '../presentation/feature/create_routines_page.dart/bloc/create_routines_module.dart';
import '../presentation/feature/device/bloc/device_module.dart';
import '../presentation/feature/devices/bloc/devices_module.dart';
import '../presentation/feature/edit_profile/bloc/edit_profile_module.dart';
import '../presentation/feature/home/bloc/home_module.dart';
import '../presentation/feature/login/bloc/login_module.dart';
import '../presentation/feature/my_home/bloc/my_home_module.dart';
import '../presentation/feature/register/bloc/register_module.dart';
import '../presentation/feature/room/bloc/room_module.dart';
import '../presentation/feature/routines/bloc/routines_module.dart';
import '../presentation/feature/setting/bloc/setting_module.dart';
import '../presentation/feature/splash/bloc/splash_module.dart';
import '../utilities/helpers/app_helper/app_flavor_helper.dart';
import '../utilities/helpers/app_helper/navigator_global_context_helper.dart';

class DependencyManager {
  static Future<void> inject(AppFlavor appFlavor) async {
    // App Flavor
    injector.registerLazySingleton<AppFlavor>(() => appFlavor);

    // Inject get current context
    injector.registerLazySingleton<NavigatorGlobalContextHelper>(
      () => NavigatorGlobalContextHelper(),
    );

    // App modules
    await AppModules.inject();

    //Splash modules
    await SplashModule.inject();

    //Login modules
    await LoginModule.inject();

    //Register
    await RegisterModule.inject();

    //add_room
    await AddRoomModule.inject();

    //home
    await HomeModule.inject();

    //room
    await MyHomeModule.inject();

    //routines
    await RoutinesModule.inject();

    //setting
    await SettingModule.inject();

    //add device
    await ConfigWifiModule.inject();
    await HandleConnectModule.inject();
    await ListDeviceModule.inject();
    await AddDeviceToRoomModule.inject();

    //create_routines
    await CreateRoutinesModule.inject();

    //edit profile
    await EditProfileModule.inject();

    //device
    await DeviceModule.inject();

    //room
    await RoomModule.inject();

    //devices
    await DevicesModule.inject();
  }
}
