import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../bloc/create_routines_presenter.dart';
import '../bloc/create_routines_state.dart';

class DaysChip extends StatelessWidget {
  const DaysChip({
    required this.createRoutinesPresenter,
    Key? key,
  }) : super(key: key);

  final CreateRoutinesPresenter createRoutinesPresenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRoutinesPresenter, CreateRoutinesState>(
      bloc: createRoutinesPresenter,
      buildWhen: (previous, current) => !listEquals(
        previous.chooseDays,
        current.chooseDays,
      ),
      builder: (context, state) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          children: List.generate(
            createRoutinesPresenter.listDay.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ChoiceChip(
                selected: state.chooseDays[index],
                onSelected: (value) {
                  createRoutinesPresenter.setChooseDay(
                    index,
                    value,
                  );
                },
                disabledColor: AppColors.greyLight,
                selectedColor: AppColors.main,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                label: SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      createRoutinesPresenter.listDay[index],
                      style: state.chooseDays[index]
                          ? AppTextStyles.size13WhileBold
                          : AppTextStyles.size13GreyBold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
