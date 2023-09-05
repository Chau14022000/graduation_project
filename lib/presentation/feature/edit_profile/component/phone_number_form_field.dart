import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/edit_profile/form_field/phone_number.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../widget/text_field_widget.dart';
import '../bloc/edit_profile_presenter.dart';
import '../bloc/edit_profile_state.dart';

class PhoneNumberFormField extends StatelessWidget {
  const PhoneNumberFormField({
    required this.editProfilePresenter,
    Key? key,
  }) : super(key: key);

  final EditProfilePresenter editProfilePresenter;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<EditProfilePresenter, EditProfileState>(
        bloc: editProfilePresenter,
        buildWhen: (previous, current) =>
            previous.phoneNumber != current.phoneNumber,
        builder: (context, state) => TextFieldWidget(
          top: 0,
          left: 0,
          right: 0,
          hintText: AppTexts.enterPhoneNumber,
          labelText: AppTexts.phoneNumber,
          keyboardType: TextInputType.phone,
          style: AppTextStyles.size13BlackBold,
          textStyle: AppTextStyles.size15Grey,
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          errorText: state.phoneNumber.error?.description,
          fillColor: Colors.transparent,
          styleBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyLight,
            ),
          ),
          controller: editProfilePresenter.phoneNumberEditingController,
          onChanged: (phoneNumber) =>
              editProfilePresenter.phoneNumberChanged(phoneNumber),
        ),
      );
}
