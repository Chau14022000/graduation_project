import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_presenter.dart';
import '../bloc/register_state.dart';

class GenderFormField extends StatelessWidget {
  const GenderFormField({
    required this.presenter,
    Key? key,
  }) : super(key: key);

  final RegisterPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterPresenter, RegisterState>(
      bloc: presenter,
      buildWhen: (previous, current) =>
          previous.dropdownValue != current.dropdownValue,
      builder: (context, state) => DropdownButton<String>(
        value: state.dropdownValue,
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
          size: 25,
          color: Colors.white,
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
        dropdownColor: Colors.transparent,
        onChanged: (value) {
          if (value != null) {
            presenter.genderChanged(value);
          }
        },
        underline: const Divider(
          color: Colors.transparent,
        ),
        items: presenter.gender
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
      ),
    );
  }
}
