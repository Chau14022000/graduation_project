import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/user/register/form_field/phone_number.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../widget/text_field_widget.dart';
import '../bloc/register_presenter.dart';
import '../bloc/register_state.dart';

class PhoneNumberFormField extends StatelessWidget {
  const PhoneNumberFormField({
    required this.presenter,
    Key? key,
  }) : super(key: key);

  final RegisterPresenter presenter;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<RegisterPresenter, RegisterState>(
        bloc: presenter,
        buildWhen: (previous, current) =>
            previous.phoneNumber != current.phoneNumber,
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFieldWidget(
            top: 0,
            left: 0,
            width: 200,
            right: 0,
            hintText: AppTexts.enterPhoneNumber,
            labelText: AppTexts.phoneNumber,
            keyboardType: TextInputType.phone,
            style: AppTextStyles.white,
            textStyle: AppTextStyles.white,
            errorStyle: const TextStyle(
              color: Colors.red,
            ),
            errorText: state.phoneNumber.error?.description,
            fillColor: Colors.transparent,
            styleBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            onChanged: (phoneNumber) =>
                presenter.phoneNumberChanged(phoneNumber),
          ),
        ),
      );
}
