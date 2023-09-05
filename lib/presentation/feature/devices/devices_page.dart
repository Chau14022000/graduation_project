import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../injection/injector.dart';
import '../../../domain/entities/my_home/home/device_entities.dart';
import '../../base/base_page.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_text_styles.dart';
import '../../resources/app_texts.dart';
import '../../widget/button_widget.dart';
import 'bloc/devices_presenter.dart';
import 'component/devices_list_view.dart';

class DevicesPage extends BasePage {
  const DevicesPage({
    required this.listDevice,
    Key? key,
  }) : super(key: key);

  final List<DeviceEntities?> listDevice;

  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends BasePageState<DevicesPage> {
  final _devicesPresenter = injector.get<DevicesPresenter>();

  @override
  void onStateCreated() {
    _devicesPresenter.initState(widget.listDevice);
    super.onStateCreated();
  }

  @override
  Color? backgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      color: AppColors.main,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => AutoRouter.of(context).pop(),
                  child: const Icon(
                    Icons.keyboard_arrow_left_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const Spacer(),
                const Text(
                  AppTexts.device,
                  style: AppTextStyles.size18WhileBold,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: DevicesListView(
                        devicesPresenter: _devicesPresenter,
                      ),
                    ),
                    ButtonWidget(
                      colorEnable: Colors.black,
                      border: 30,
                      onTap: () {
                        _devicesPresenter.addList();
                        AutoRouter.of(context).pop(
                          _devicesPresenter.state.listDevices,
                        );
                      },
                      enable: true,
                      child: const Text(
                        AppTexts.addDevice,
                        style: AppTextStyles.size13WhileBold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
