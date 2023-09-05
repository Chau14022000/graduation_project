import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../domain/entities/my_home/routines/routines_entities.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../../../routes/app_router.gr.dart';
import '../bloc/routines_presenter.dart';

class ItemRoutines extends StatelessWidget {
  const ItemRoutines({
    required this.routines,
    required this.presenter,
    Key? key,
  }) : super(key: key);

  final RoutinesEntities routines;
  final RoutinesPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    routines.name ?? '',
                    style: AppTextStyles.size13BlackBold,
                  ),
                  const Spacer(),
                  FlutterSwitch(
                    inactiveColor: AppColors.greyLight,
                    toggleColor: Colors.white,
                    value: routines.status,
                    activeColor: AppColors.main,
                    onToggle: (value) {
                      presenter.changeStatus(
                        value,
                        routines,
                      );
                    },
                    activeTextFontWeight: FontWeight.normal,
                    inactiveTextFontWeight: FontWeight.normal,
                    showOnOff: true,
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          routines.timeStart,
                          style: AppTextStyles.size13BlackBold,
                        ),
                        const Spacer(),
                        Text(
                          'x${routines.devices.length} Devices',
                          style: AppTextStyles.size11Grey,
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            AutoRouter.of(context).push(
                              CreateRoutinesRoute(routine: routines),
                            );
                          },
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.greyLight,
                            child: Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: AppColors.grey,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              routines.convertDayInWeek.join(' '),
                              style: AppTextStyles.size13BlackBold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
