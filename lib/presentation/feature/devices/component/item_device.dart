import 'package:flutter/material.dart';

import '../../../../domain/entities/my_home/home/device_entities.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../bloc/devices_presenter.dart';

class ItemDevice extends StatelessWidget {
  const ItemDevice({
    required this.device,
    required this.presenter,
    Key? key,
  }) : super(key: key);

  final DeviceEntities device;
  final DevicesPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
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
          color: device.deviceSelect ? AppColors.main : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            device.nameDevice,
            style: AppTextStyles.size18BlackBold,
          ),
        ),
      ),
    );
  }
}
