import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppBorder {
  static const borderGreyAF = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greyRoutines,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
}
