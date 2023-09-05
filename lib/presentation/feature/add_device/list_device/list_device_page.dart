import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../injection/injector.dart';
import '../../../base/base_page.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../widget/app_bar_device.dart';
import 'bloc/list_device_presenter.dart';
import 'component/devices_list_view.dart';

class ListDevicePage extends BasePage {
  const ListDevicePage({
    required this.listIdDevice,
    Key? key,
  }) : super(key: key);
  final List<String> listIdDevice;

  @override
  _ListDevicePageState createState() => _ListDevicePageState();
}

class _ListDevicePageState extends BasePageState<ListDevicePage> {
  final _presenter = injector.get<ListDevicePresenter>();

  @override
  void onStateCreated() {
    super.onStateCreated();
    _presenter.onStateCreated(widget.listIdDevice);
  }

  @override
  Color? backgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text(
            AppTexts.findDevice,
            style: AppTextStyles.size13BlackBold,
          ),
          const SizedBox(height: 30),
          Expanded(
            child: DevicesListView(
              listDevicesPresenter: _presenter,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get resizeToAvoidBottomInset => true;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBarDevice(
        title: AppTexts.addDevice,
        onTap: () {
          AutoRouter.of(context).pop();
        },
      ),
    );
  }
}
