import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../widget/button_widget.dart';
import '../bloc/register_presenter.dart';
import '../bloc/register_state.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    required this.onTap,
    required this.presenter,
    Key? key,
  }) : super(key: key);

  final Function() onTap;
  final RegisterPresenter presenter;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<RegisterPresenter, RegisterState>(
        bloc: presenter,
        buildWhen: (previous, current) =>
            previous.status.isValidated != current.status.isValidated,
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: ButtonWidget(
            colorEnable: Colors.amber,
            color: Colors.grey,
            border: 10,
            enable: state.status.isValidated,
            onTap: () => onTap.call(),
            child: const Text(
              AppTexts.register,
              style: AppTextStyles.whiteBold,
            ),
          ),
        ),
      );
}
