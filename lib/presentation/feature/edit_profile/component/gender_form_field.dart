import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/app_colors.dart';
import '../bloc/edit_profile_presenter.dart';
import '../bloc/edit_profile_state.dart';

class GenderFormField extends StatelessWidget {
  const GenderFormField({
    required this.editProfilePresenter,
    Key? key,
  }) : super(key: key);

  final EditProfilePresenter editProfilePresenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfilePresenter, EditProfileState>(
      bloc: editProfilePresenter,
      buildWhen: (previous, current) =>
          previous.dropdownValue != current.dropdownValue,
      builder: (context, state) => SizedBox(
        width: double.infinity,
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              focusColor: AppColors.greyLight,
              value: editProfilePresenter.state.dropdownValue,
              items: editProfilePresenter.gender
                  .map(
                    (e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                editProfilePresenter.genderChanged(
                  value.toString(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
