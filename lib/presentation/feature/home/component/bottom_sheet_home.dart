import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../routes/app_router.gr.dart';
import '../bloc/home_presenter.dart';
import '../bloc/home_state.dart';

class BottomSheetHome extends StatelessWidget {
  const BottomSheetHome({
    required this.homePresenter,
    Key? key,
  }) : super(key: key);

  final HomePresenter homePresenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePresenter, HomeState>(
      bloc: homePresenter,
      builder: (context, state) => SizedBox(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment(-0.7, 0),
              child: Text(
                AppTexts.addNew,
                style: AppTextStyles.size18BlackBold,
              ),
            ),
            const Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: homePresenter.indexSelector == 0
                        ? AppColors.main
                        : AppColors.greyLight,
                    child: GestureDetector(
                      onTap: homePresenter.indexSelector == 0
                          ? () async {
                              Navigator.pop(context);
                              final result = await AutoRouter.of(context).push(
                                const AddRoomRoute(),
                              );
                              if (result == true) {
                                await homePresenter.initState();
                              }
                            }
                          : () {},
                      child: Icon(
                        Icons.add_business_outlined,
                        size: 40,
                        color: homePresenter.indexSelector == 0
                            ? Colors.white
                            : AppColors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Text(
                    AppTexts.addNewRoom,
                    style: homePresenter.indexSelector == 0
                        ? AppTextStyles.size13MainBold
                        : AppTextStyles.size13GreyBold,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Divider(thickness: 1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: homePresenter.indexSelector == 1
                        ? AppColors.main
                        : AppColors.greyLight,
                    child: GestureDetector(
                      onTap: homePresenter.indexSelector == 1
                          ? () async {
                              Navigator.pop(context);
                              final result = await AutoRouter.of(context).push(
                                const ConfigWifiRoute(),
                              );
                              if (result == true) {
                                await homePresenter.initState();
                              }
                            }
                          : () {},
                      child: Icon(
                        Icons.devices_outlined,
                        size: 40,
                        color: homePresenter.indexSelector == 1
                            ? Colors.white
                            : AppColors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Text(
                    AppTexts.addNewDevice,
                    style: homePresenter.indexSelector == 1
                        ? AppTextStyles.size13MainBold
                        : AppTextStyles.size13GreyBold,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
