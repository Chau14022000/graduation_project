import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../domain/entities/my_home/home/device_entities.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../bloc/room_presenter.dart';

class ItemDevice extends StatelessWidget {
  const ItemDevice({
    required this.device,
    required this.presenter,
    Key? key,
  }) : super(key: key);

  final RoomPresenter presenter;
  final DeviceEntities device;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.greyLight,
              blurRadius: 4,
              offset: Offset(3, 7),
            ),
            BoxShadow(
              color: AppColors.greyLight,
              blurRadius: 9,
              offset: Offset(-2, -2),
            ),
          ],
          color: device.connectWifi
              ? Colors.white
              : AppColors.notInterNet.withAlpha(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            Text(
              device.nameDevice,
              style: !device.connectWifi
                  ? AppTextStyles.size13NotInternetBold
                  : device.state
                      ? AppTextStyles.size13MainBold
                      : AppTextStyles.size13GreyBold,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.wifi,
                  size: 20,
                  color: device.connectWifi ? Colors.green : Colors.red,
                ),
                FlutterSwitch(
                  inactiveColor: device.connectWifi
                      ? AppColors.greyLight
                      : AppColors.notInterNet,
                  toggleColor: Colors.white,
                  value: device.state,
                  activeColor: device.connectWifi
                      ? AppColors.main
                      : AppColors.notInterNet,
                  onToggle: (value) {
                    presenter.changeStatus(
                      value,
                      device,
                    );
                  },
                  activeTextFontWeight: FontWeight.normal,
                  inactiveTextFontWeight: FontWeight.normal,
                  showOnOff: true,
                ),
              ],
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
