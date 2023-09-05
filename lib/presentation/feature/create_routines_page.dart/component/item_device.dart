import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../bloc/create_routines_presenter.dart';
import '../bloc/create_routines_state.dart';

class ItemDevice extends StatelessWidget {
  const ItemDevice({
    required this.createRoutinesPresenter,
    required this.index,
    required this.onOffRoutine,
    Key? key,
  }) : super(key: key);

  final int index;

  final CreateRoutinesPresenter createRoutinesPresenter;

  final bool onOffRoutine;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRoutinesPresenter, CreateRoutinesState>(
      bloc: createRoutinesPresenter,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        child: Container(
          height: 80,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyLight,
                blurRadius: 4,
                offset: Offset(3, 7),
              ),
              BoxShadow(
                color: AppColors.greyLight,
                blurRadius: 9,
                offset: Offset(-2, -2),
              ),
            ],
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Text(
                state.listDevice[index]!.nameDevice,
                style: AppTextStyles.size13MainBold,
              ),
              const Spacer(),
              FlutterSwitch(
                inactiveColor: AppColors.greyLight,
                value: onOffRoutine,
                activeColor: AppColors.main,
                onToggle: (value) {
                  createRoutinesPresenter.onToggle(value, index);
                },
                activeTextFontWeight: FontWeight.normal,
                inactiveTextFontWeight: FontWeight.normal,
                showOnOff: true,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
