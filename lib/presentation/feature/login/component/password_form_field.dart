import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/user/login/form_field/password.dart';
import '../../../../injection/injector.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../widget/text_field_widget.dart';
import '../bloc/login_presenter.dart';
import '../bloc/login_state.dart';

class PasswordFormField extends StatelessWidget {
  PasswordFormField({Key? key}) : super(key: key);

  final _loginPresenter = injector.get<LoginPresenter>();

  @override
  Widget build(BuildContext context) => BlocBuilder<LoginPresenter, LoginState>(
        bloc: _loginPresenter,
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFieldWidget(
            top: 0,
            left: 0,
            right: 0,
            hintText: AppTexts.enterPassword,
            style: AppTextStyles.white,
            textStyle: AppTextStyles.white,
            errorStyle: const TextStyle(
              color: Colors.red,
            ),
            labelText: AppTexts.password,
            keyboardType: TextInputType.text,
            errorText: state.password.error?.description,
            fillColor: Colors.transparent,
            styleBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            onChanged: (password) => _loginPresenter.passwordChanged(password),
          ),
        ),
      );
}
