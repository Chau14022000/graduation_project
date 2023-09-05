import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../routes/app_router.gr.dart';
import '../bloc/list_device_presenter.dart';
import '../bloc/list_device_state.dart';
import 'item_device.dart';

class DevicesListView extends StatelessWidget {
  const DevicesListView({
    required this.listDevicesPresenter,
    Key? key,
  }) : super(key: key);

  final ListDevicePresenter listDevicesPresenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDevicePresenter, ListDeviceState>(
      bloc: listDevicesPresenter,
      buildWhen: (previous, current) =>
          !listEquals(previous.listIdDevice, current.listIdDevice),
      builder: (context, state) => ListView.builder(
        itemCount: state.listIdDevice.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            AutoRouter.of(context).push(
              AddDeviceToRoomRoute(
                idDevice: state.listIdDevice[index],
              ),
            );
          },
          child: ItemDevice(
            idDevice: state.listIdDevice[index],
          ),
        ),
      ),
    );
  }
}
