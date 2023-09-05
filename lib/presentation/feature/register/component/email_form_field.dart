import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/user/register/form_field/email.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../widget/text_field_widget.dart';
import '../bloc/register_presenter.dart';
import '../bloc/register_state.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    required this.presenter,
    Key? key,
  }) : super(key: key);

  final RegisterPresenter presenter;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<RegisterPresenter, RegisterState>(
        bloc: presenter,
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFieldWidget(
            top: 0,
            left: 0,
            right: 0,
            hintText: AppTexts.enterEmail,
            labelText: AppTexts.email,
            keyboardType: TextInputType.emailAddress,
            style: AppTextStyles.white,
            textStyle: AppTextStyles.white,
            errorStyle: const TextStyle(
              color: Colors.red,
            ),
            errorText: state.email.error?.description,
            fillColor: Colors.transparent,
            styleBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            onChanged: (email) => presenter.emailChanged(email),
          ),
        ),
      );
}
