import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes/app_router.gr.dart';
import '../bloc/room_presenter.dart';
import '../bloc/room_state.dart';
import 'item_device.dart';

class DeviceListView extends StatelessWidget {
  const DeviceListView({
    required this.roomPresenter,
    Key? key,
  }) : super(key: key);

  final RoomPresenter roomPresenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomPresenter, RoomState>(
      bloc: roomPresenter,
      buildWhen: (previous, current) => !listEquals(
        previous.listDevice,
        current.listDevice,
      ),
      builder: (context, state) => ListView.builder(
        itemCount: state.listDevice.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            AutoRouter.of(context).push(
              DeviceRoute(
                token: state.listDevice[index].id,
              ),
            );
          },
          child: ItemDevice(
            device: state.listDevice[index],
            presenter: roomPresenter,
          ),
        ),
      ),
    );
  }
}
