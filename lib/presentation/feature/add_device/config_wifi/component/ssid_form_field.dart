import 'package:flutter/material.dart';

import '../../../../../injection/injector.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_text_styles.dart';
import '../../../../resources/app_texts.dart';
import '../../../../widget/text_field_widget.dart';
import '../bloc/config_wifi_presenter.dart';

class SSIDFormField extends StatelessWidget {
  SSIDFormField({Key? key}) : super(key: key);

  final _presenter = injector.get<ConfigWifiPresenter>();

  @override
  Widget build(BuildContext context) => TextFieldWidget(
        top: 0,
        left: 10,
        right: 10,
        cursorColor: AppColors.grey,
        keyboardType: TextInputType.emailAddress,
        fillColor: Colors.transparent,
        labelText: AppTexts.ssid,
        style: AppTextStyles.size13BlackBold,
        styleBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        onChanged: _presenter.onChangeSSID,
        controller: _presenter.ssid,
      );
}
