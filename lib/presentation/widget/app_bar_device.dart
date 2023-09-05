import 'package:flutter/material.dart';

import '../resources/app_text_styles.dart';

class AppBarDevice extends StatelessWidget {
  const AppBarDevice({
    required this.title,
    required this.onTap,
    this.onTapRight,
    this.textRight,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? textRight;
  final Function() onTap;
  final Function()? onTapRight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          Text(
            title,
            style: AppTextStyles.whiteBold,
          ),
          GestureDetector(
            onTap: () => onTapRight?.call(),
            child: Text(
              textRight ?? '',
              style: AppTextStyles.size11MainBold,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
