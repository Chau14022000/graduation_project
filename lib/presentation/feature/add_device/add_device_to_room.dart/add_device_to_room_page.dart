import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../injection/injector.dart';
import '../../../base/base_page.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../routes/app_router.gr.dart';
import '../../../widget/app_bar_device.dart';
import 'bloc/add_device_to_room_presenter.dart';
import 'component/room_grip_view.dart';

class AddDeviceToRoomPage extends BasePage {
  const AddDeviceToRoomPage({
    required this.idDevice,
    Key? key,
  }) : super(key: key);

  final String idDevice;

  @override
  _AddDeviceToRoomState createState() => _AddDeviceToRoomState();
}

class _AddDeviceToRoomState extends BasePageState<AddDeviceToRoomPage> {
  final _presenter = injector.get<AddDeviceToRoomPresenter>();

  @override
  void onStateCreated() {
    super.onStateCreated();
    _presenter.onStateCreated();
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
            AppTexts.addDeviceToRoom,
            style: AppTextStyles.size13BlackBold,
          ),
          const SizedBox(height: 30),
          Expanded(
            child: RoomGripView(
              presenter: _presenter,
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
        textRight: AppTexts.complete,
        onTap: () {
          AutoRouter.of(context).pop();
        },
        onTapRight: () async {
          showProgressHud(context);
          await _presenter.addDevice(widget.idDevice);
          await dismissProgressHud();
          if (mounted) {
            await AutoRouter.of(context).push(
              const MyHomeRoute(),
            );
          }
        },
      ),
    );
  }
}
