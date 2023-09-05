import 'package:flutter/material.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_text_styles.dart';

class ItemDevice extends StatelessWidget {
  const ItemDevice({
    required this.idDevice,
    Key? key,
  }) : super(key: key);

  final String idDevice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
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
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            idDevice,
            style: AppTextStyles.size13MainBold,
          ),
        ),
      ),
    );
  }
}
