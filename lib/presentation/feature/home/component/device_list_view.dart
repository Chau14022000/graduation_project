import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes/app_router.gr.dart';
import '../bloc/home_presenter.dart';
import '../bloc/home_state.dart';
import 'item_device.dart';

class DeviceListView extends StatelessWidget {
  const DeviceListView({
    required this.homePresenter,
    Key? key,
  }) : super(key: key);

  final HomePresenter homePresenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePresenter, HomeState>(
      bloc: homePresenter,
      buildWhen: (previous, current) => !listEquals(
        previous.listDevice,
        current.listDevice,
      ),
      builder: (context, state) => ListView.builder(
        itemCount: state.listDevice.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () async {
            final result = await AutoRouter.of(context).push(
              DeviceRoute(
                token: state.listDevice[index].id,
              ),
            );
            if (result == true) {
              await homePresenter.initState();
            }
          },
          child: ItemDevice(
            device: state.listDevice[index],
            presenter: homePresenter,
          ),
        ),
      ),
    );
  }
}
