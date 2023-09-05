import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../injection/injector.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../widget/button_widget.dart';
import '../bloc/login_presenter.dart';
import '../bloc/login_state.dart';

class LoginButton extends StatelessWidget {
  LoginButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Function() onTap;

  final _loginPresenter = injector.get<LoginPresenter>();

  @override
  Widget build(BuildContext context) => BlocBuilder<LoginPresenter, LoginState>(
        bloc: _loginPresenter,
        buildWhen: (previous, current) =>
            previous.status.isValidated != current.status.isValidated,
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: ButtonWidget(
            onTap: () => onTap.call(),
            colorEnable: Colors.amber,
            color: Colors.grey,
            border: 10,
            enable: state.status.isValidated,
            child: const Text(
              AppTexts.enterYourHouse,
              style: AppTextStyles.whiteBold,
            ),
          ),
        ),
      );
}
