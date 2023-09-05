import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes/app_router.gr.dart';
import '../bloc/home_presenter.dart';
import '../bloc/home_state.dart';
import 'item_room.dart';

class RoomGripView extends StatelessWidget {
  const RoomGripView({
    required this.homePresenter,
    Key? key,
  }) : super(key: key);

  final HomePresenter homePresenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePresenter, HomeState>(
      buildWhen: (previous, current) =>
          previous.roomSelector != current.roomSelector ||
          previous.listRoom != current.listRoom,
      bloc: homePresenter,
      builder: (context, state) => GridView.count(
        childAspectRatio: 1,
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        children: List.generate(
          state.listRoom.length,
          (index) => Dismissible(
            key: Key(state.listRoom[index].id!),
            onDismissed: (v) async {
              await homePresenter.removeRoom(
                state.listRoom[index].id!,
              );
            },
            child: GestureDetector(
              onTap: () async {
                homePresenter.changeRoomSelector(
                  state.listRoom[index],
                );
                final result = await AutoRouter.of(context).push(
                  RoomRoute(
                    roomEntities: state.listRoom[index],
                  ),
                );
                if (result == true) {
                  await homePresenter.initState();
                }
              },
              child: ItemRoom(
                room: state.listRoom[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
