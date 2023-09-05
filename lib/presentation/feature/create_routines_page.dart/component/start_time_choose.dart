import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../bloc/create_routines_presenter.dart';
import '../bloc/create_routines_state.dart';

class StartTimeChoose extends StatelessWidget {
  const StartTimeChoose({
    required this.createRoutinesPresenter,
    Key? key,
  }) : super(key: key);

  final CreateRoutinesPresenter createRoutinesPresenter;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRoutinesPresenter, CreateRoutinesState>(
      bloc: createRoutinesPresenter,
      buildWhen: (previous, current) => previous.startTime != current.startTime,
      builder: (context, state) => GestureDetector(
        onTap: () async {
          final newTime = await showTimePicker(
            context: context,
            initialTime: state.startTime ?? TimeOfDay.now(),
          );
          createRoutinesPresenter.setStartTime(newTime);
        },
        child: Container(
          width: 170,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
              color: AppColors.greyRoutines,
            ),
          ),
          alignment: Alignment.centerLeft,
          child: state.startTime == null
              ? const Icon(Icons.query_builder_outlined)
              : Text(
                  '${state.startTime?.hour.toString().padLeft(2, '0')}'
                  ':${state.startTime?.minute.toString().padLeft(2, '0')}',
                  style: AppTextStyles.size13BlackBold,
                ),
        ),
      ),
    );
  }
}
