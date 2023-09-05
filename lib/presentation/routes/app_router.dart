import 'package:auto_route/auto_route.dart';

import '../feature/add_device/add_device_to_room.dart/add_device_to_room_page.dart';
import '../feature/add_device/config_wifi/config_wifi_page.dart';
import '../feature/add_device/list_device/list_device_page.dart';
import '../feature/add_room/add_room_page.dart';
import '../feature/create_routines_page.dart/create_routines_page.dart';
import '../feature/device/device_page.dart';
import '../feature/devices/devices_page.dart';
import '../feature/edit_profile/edit_profile_page.dart';
import '../feature/login/login_page.dart';
import '../feature/my_home/my_home_page.dart';
import '../feature/register/register_page.dart';
import '../feature/room/room_page.dart';
import '../feature/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RegisterPage),
    AutoRoute(page: ConfigWifiPage),
    AutoRoute(page: AddRoomPage),
    AutoRoute(page: CreateRoutinesPage),
    AutoRoute(page: EditProfilePage),
    AutoRoute(page: MyHomePage),
    AutoRoute(page: DevicePage),
    AutoRoute(page: DevicesPage),
    AutoRoute(page: RoomPage),
    AutoRoute(page: ListDevicePage),
    AutoRoute(page: AddDeviceToRoomPage),
  ],
)
class $AppRouter {}
