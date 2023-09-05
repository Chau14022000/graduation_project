import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/my_home/home/room_entities.dart';
import '../../../injection/injector.dart';
import '../../base/base_page.dart';
import '../../resources/app_text_styles.dart';
import 'bloc/room_presenter.dart';
import 'bloc/room_state.dart';
import 'component/device_list_view.dart';

class RoomPage extends BasePage {
  const RoomPage({
    required this.roomEntities,
    Key? key,
  }) : super(key: key);
  final RoomEntities roomEntities;

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends BasePageState<RoomPage> {
  final _roomPresenter = injector.get<RoomPresenter>();
  @override
  Color? backgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  void onStateCreated() {
    _roomPresenter.initState(widget.roomEntities);
    super.onStateCreated();
  }

    @override
  Future<bool> onWillPop() {
    Navigator.pop(context, true);
    return Future(() => false);
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder<RoomPresenter, RoomState>(
      bloc: _roomPresenter,
      buildWhen: (previous, current) =>
          previous.listDevice != current.listDevice ||
          previous.roomEntities != current.roomEntities,
      builder: (context, state) => Column(
        children: [
          Container(
            color: Colors.black,
            height: 100,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    widget.roomEntities.covertIcon,
                    size: 80,
                    color: Colors.white,
                  ),
                  const Spacer(),
                  Text(
                    widget.roomEntities.nameRoom.toUpperCase(),
                    style: AppTextStyles.size18WhileBold,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: DeviceListView(roomPresenter: _roomPresenter,),
          ),
        ],
      ),
    );
  }
}
