import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection/injector.dart';
import '../../base/base_page.dart';
import '../../resources/app_colors.dart';
import '../../routes/app_router.gr.dart';
import 'bloc/device_presenter.dart';
import 'bloc/device_state.dart';
import 'component/edit_device.dart';
import 'component/state_device_button.dart';

class DevicePage extends BasePage {
  const DevicePage({
    required this.token,
    Key? key,
  }) : super(key: key);
  final String token;

  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends BasePageState<DevicePage> {
  final _devicePresenter = injector.get<DevicePresenter>();
  @override
  Color? backgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  void onStateCreated() {
    _devicePresenter.initState(widget.token);
    super.onStateCreated();
  }

  @override
  Future<bool> onWillPop() {
    Navigator.pop(context, true);
    return Future(() => false);
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder<DevicePresenter, DeviceState>(
      bloc: _devicePresenter,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: StateDeviceButton(
              devicePresenter: _devicePresenter,
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(
                      CreateRoutinesRoute(
                        deviceEntities: [state.deviceEntities],
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.schedule_outlined,
                    color: AppColors.main,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    await _devicePresenter.getRoom();
                    await showDialog(
                      context: context,
                      builder: (_) => EditDevice(
                        device: state.deviceEntities,
                        devicePresenter: _devicePresenter,
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.settings_outlined,
                    color: AppColors.main,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
