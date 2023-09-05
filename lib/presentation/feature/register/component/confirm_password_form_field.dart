import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/user/register/form_field/confirm_password.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../widget/text_field_widget.dart';
import '../bloc/register_presenter.dart';
import '../bloc/register_state.dart';

class ConfirmPasswordFormField extends StatelessWidget {
  const ConfirmPasswordFormField({
    required this.presenter,
    Key? key,
  }) : super(key: key);
  
  final RegisterPresenter presenter;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<RegisterPresenter, RegisterState>(
        bloc: presenter,
        buildWhen: (previous, current) =>
            previous.confirmPassword != current.confirmPassword ||
            previous.password != current.password,
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFieldWidget(
            top: 0,
            left: 0,
            right: 0,
            hintText: AppTexts.enterConfirmPassword,
            style: AppTextStyles.white,
            textStyle: AppTextStyles.white,
            errorStyle: const TextStyle(
              color: Colors.red,
            ),
            labelText: AppTexts.confirmPassword,
            keyboardType: TextInputType.text,
            errorText: state.confirmPassword.error?.description,
            fillColor: Colors.transparent,
            styleBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            controller: presenter.confirmPasswordController,
            onChanged: (confirmPassword) => presenter.confirmPasswordChanged(
              confirmPassword,
            ),
          ),
        ),
      );
}
