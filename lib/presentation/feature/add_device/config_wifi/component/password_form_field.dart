import 'package:flutter/material.dart';

import '../../../../../injection/injector.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_text_styles.dart';
import '../../../../resources/app_texts.dart';
import '../../../../widget/text_field_widget.dart';
import '../bloc/config_wifi_presenter.dart';

class PasswordFormField extends StatelessWidget {
  PasswordFormField({Key? key}) : super(key: key);
  final _presenter = injector.get<ConfigWifiPresenter>();
  @override
  Widget build(BuildContext context) => TextFieldWidget(
        top: 0,
        left: 10,
        right: 10,
        cursorColor: AppColors.main,
        keyboardType: TextInputType.text,
        labelText: AppTexts.password,
        fillColor: Colors.transparent,
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
        controller: _presenter.password,
        onChanged: _presenter.onChangePassword,
      );
}
