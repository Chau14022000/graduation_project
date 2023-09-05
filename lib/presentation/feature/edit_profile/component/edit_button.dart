import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../widget/button_widget.dart';
import '../bloc/edit_profile_presenter.dart';
import '../bloc/edit_profile_state.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    required this.onTap,
    required this.editProfilePresenter,
    Key? key,
  }) : super(key: key);

  final EditProfilePresenter editProfilePresenter;
  final Function() onTap;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<EditProfilePresenter, EditProfileState>(
        bloc: editProfilePresenter,
        buildWhen: (previous, current) =>
            previous.status.isValidated != current.status.isValidated,
        builder: (context, state) => GestureDetector(
          onTap: () => onTap.call(),
          child: ButtonWidget(
            colorEnable: Colors.amber,
            color: Colors.grey,
            border: 10,
            enable: state.status.isValidated,
            child: const Text(
              AppTexts.save,
              style: AppTextStyles.whiteBold,
            ),
          ),
        ),
      );
}
