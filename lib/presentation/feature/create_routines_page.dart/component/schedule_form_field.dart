import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/app_border.dart';
import '../../../resources/app_text_styles.dart';
import '../../../widget/text_field_widget.dart';
import '../bloc/create_routines_presenter.dart';
import '../bloc/create_routines_state.dart';

class ScheduleFormField extends StatelessWidget {
  const ScheduleFormField({
    required this.createRoutinesPresenter,
    Key? key,
  }) : super(key: key);

  final CreateRoutinesPresenter createRoutinesPresenter;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CreateRoutinesPresenter, CreateRoutinesState>(
        bloc: createRoutinesPresenter,
        builder: (context, state) => TextFieldWidget(
          top: 15,
          left: 10,
          right: 10,
          cursorColor: Colors.black,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            Icons.work,
            color: Colors.black,
          ),
          style: AppTextStyles.size13BlackBold,
          styleBorder: AppBorder.borderGreyAF,
          controller: createRoutinesPresenter.scheduleEditingController,
        ),
      );
}
