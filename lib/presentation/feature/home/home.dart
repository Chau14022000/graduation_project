import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection/injector.dart';
import '../../base/base_page.dart';
import '../../resources/app_texts.dart';
import '../../routes/app_router.gr.dart';
import '../../widget/app_bar_widget.dart';
import 'bloc/home_presenter.dart';
import 'bloc/home_state.dart';
import 'component/bottom_sheet_home.dart';
import 'component/device_list_view.dart';
import 'component/room_grip_view.dart';

class Home extends BasePage {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends BasePageState<Home> {
  final _homePresenter = injector.get<HomePresenter>();

  @override
  int get length => 2;

  @override
  void onStateCreated() {
    _homePresenter.initState();
    super.onStateCreated();
  }

  @override
  Color? backgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(130),
      child: BlocBuilder<HomePresenter, HomeState>(
        buildWhen: (previous, current) => previous.avatar != current.avatar,
        bloc: _homePresenter,
        builder: (context, state) {
          return AppBarWidget(
            title: AppTexts.yourRoom,
            width: 250,
            textBottomOne: AppTexts.room,
            textBottomTwo: AppTexts.device,
            avatar: _homePresenter.state.avatar,
            onTap: onTap,
            onTapIndex: (index) {
              _homePresenter.onTapIndex(index);
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return TabBarView(
      children: [
        Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: RoomGripView(
                homePresenter: _homePresenter,
              ),
            ),
            Align(
              alignment: const Alignment(0.9, 0),
              child: GestureDetector(
                onTap: () async {
                  await _homePresenter.scanQRCode();
                  if (mounted) {
                    await AutoRouter.of(context).push(
                      ListDeviceRoute(
                        listIdDevice: [
                          _homePresenter.state.getResult,
                        ],
                      ),
                    );
                  }
                },
                child: const Icon(
                  Icons.qr_code_scanner,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
        Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: DeviceListView(
                homePresenter: _homePresenter,
              ),
            ),
            Align(
              alignment: const Alignment(0.9, 0),
              child: GestureDetector(
                onTap: () async {
                  await _homePresenter.scanQRCode();
                  if (mounted) {
                    await AutoRouter.of(context).push(
                      ListDeviceRoute(
                        listIdDevice: [
                          _homePresenter.state.getResult,
                        ],
                      ),
                    );
                  }
                },
                child: const Icon(
                  Icons.qr_code_scanner,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }

  void onTap() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (contextBt) {
        return BottomSheetHome(
          homePresenter: _homePresenter,
        );
      },
    );
  }

  void removeRoom() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (contextBt) {
        return BottomSheetHome(
          homePresenter: _homePresenter,
        );
      },
    );
  }
}
