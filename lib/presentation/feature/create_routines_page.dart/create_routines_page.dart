import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../domain/entities/my_home/home/device_entities.dart';
import '../../../domain/entities/my_home/routines/routines_entities.dart';
import '../../../injection/injector.dart';
import '../../base/base_page.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_text_styles.dart';
import '../../resources/app_texts.dart';
import '../../routes/app_router.gr.dart';
import '../../widget/app_bar_device.dart';
import '../../widget/button_widget.dart';
import 'bloc/create_routines_presenter.dart';
import 'bloc/create_routines_state.dart';
import 'component/days_chip.dart';
import 'component/device_list_view.dart';
import 'component/schedule_form_field.dart';
import 'component/start_time_choose.dart';

class CreateRoutinesPage extends BasePage {
  const CreateRoutinesPage({
    this.deviceEntities,
    this.routine,
    Key? key,
  }) : super(key: key);

  final List<DeviceEntities>? deviceEntities;
  final RoutinesEntities? routine;

  @override
  _CreateRoutinesPageState createState() => _CreateRoutinesPageState();
}

class _CreateRoutinesPageState extends BasePageState<CreateRoutinesPage> {
  final _createRoutinesPresenter = injector.get<CreateRoutinesPresenter>();

  @override
  void onStateCreated() {
    _createRoutinesPresenter.initState(
      widget.deviceEntities ?? [],
      widget.routine,
    );
    super.onStateCreated();
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder<CreateRoutinesPresenter, CreateRoutinesState>(
      bloc: _createRoutinesPresenter,
      buildWhen: (previous, current) =>
          previous.isEveryDay != current.isEveryDay ||
          previous.status != current.status,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              AppTexts.schedule,
              style: AppTextStyles.size11GreyAFBold,
            ),
            const SizedBox(height: 10),
            ScheduleFormField(
              createRoutinesPresenter: _createRoutinesPresenter,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppTexts.startTime,
                      style: AppTextStyles.size11GreyAFBold,
                    ),
                    const SizedBox(height: 10),
                    StartTimeChoose(
                      createRoutinesPresenter: _createRoutinesPresenter,
                    ),
                  ],
                ),
                const Spacer(),
                FlutterSwitch(
                  toggleColor: Colors.white,
                  value: state.status,
                  activeColor: AppColors.main,
                  onToggle: (value) {
                    _createRoutinesPresenter.changeStatus(
                      value,
                    );
                  },
                  activeTextFontWeight: FontWeight.normal,
                  inactiveTextFontWeight: FontWeight.normal,
                  showOnOff: true,
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              AppTexts.selectDate,
              style: AppTextStyles.size11GreyAFBold,
            ),
            const SizedBox(height: 10),
            DaysChip(
              createRoutinesPresenter: _createRoutinesPresenter,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Switch(
                  value: state.isEveryDay,
                  activeColor: AppColors.main,
                  onChanged: (value) {
                    _createRoutinesPresenter.setChooseAll(value);
                  },
                ),
                const Text(
                  AppTexts.everyDay,
                  style: AppTextStyles.size13MainBold,
                )
              ],
            ),
            const SizedBox(height: 40),
            ButtonWidget(
              colorEnable: Colors.blue,
              border: 16,
              enable: true,
              onTap: () async {
                final result = await AutoRouter.of(context).push(
                  DevicesRoute(
                    listDevice: _createRoutinesPresenter.state.listDevice,
                  ),
                ) as List<DeviceEntities>?;
                if (result != null) {
                  await _createRoutinesPresenter.initState(
                    result,
                    widget.routine,
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    AppTexts.addDevice,
                    style: AppTextStyles.size13WhileBold,
                  )
                ],
              ),
            ),
            Expanded(
              child: DeviceListView(
                createRoutinesPresenter: _createRoutinesPresenter,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Color? backgroundColor(BuildContext context) {
    return AppColors.backgroundPage;
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBarDevice(
        title: AppTexts.createRoutines,
        textRight: AppTexts.save,
        onTapRight: onTap,
        onTap: () {
          AutoRouter.of(context).pop();
        },
      ),
    );
  }

  Future<void> onTap() async {
    showProgressHud(context);
    if (await _createRoutinesPresenter.saveRoutines()) {
      await dismissProgressHud();
      if (mounted) {
        await AutoRouter.of(context).push(
          const MyHomeRoute(),
        );
      }
    } else {
      await Fluttertoast.showToast(
        msg: AppTexts.pleaseFill,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        fontSize: 20,
      );
      await dismissProgressHud();
    }
  }

  @override
  bool get resizeToAvoidBottomInset => true;
}
