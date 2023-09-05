import 'package:auto_route/auto_route.dart';
import 'package:esptouch_flutter/esptouch_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection/injector.dart';
import '../../../base/base_page.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_texts.dart';
import '../../../widget/app_bar_device.dart';
import 'bloc/handle_connect_presenter.dart';
import 'bloc/handle_connect_state.dart';
import 'component/count_down.dart';
import 'component/list_loading.dart';

class HandleConnectPage extends BasePage {
  const HandleConnectPage({
    required this.ssid,
    required this.bssid,
    required this.password,
    required this.packet,
    Key? key,
  }) : super(key: key);

  final String ssid;
  final String bssid;
  final String password;
  final ESPTouchPacket packet;

  @override
  HandleConnectPageState createState() => HandleConnectPageState();
}

class HandleConnectPageState extends BasePageState<HandleConnectPage> {
  final _presenter = injector.get<HandleConnectPresenter>();

  @override
  void onStateCreated() {
    super.onStateCreated();
    _presenter.onStateCreated(
      ssid: widget.ssid,
      bssid: widget.bssid,
      password: widget.password,
      packet: widget.packet,
      context: context,
    );
  }

  @override
  Color? backgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  Widget buildBody(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          CountDown(),
          const SizedBox(height: 150),
          ListLoading(),
          const Spacer(),
          BlocBuilder<HandleConnectPresenter, HandleConnectState>(
              bloc: _presenter,
              buildWhen: (previous, current) =>
                  previous.loading != current.loading,
              builder: (context, state) {
                if (state.counter == 0 &&
                    state.loading != LoadingDotType.loading) {
                  return Container(
                    width: 100,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          _presenter.onStateCreated(
                            ssid: widget.ssid,
                            bssid: widget.bssid,
                            password: widget.password,
                            packet: widget.packet,
                            context: context,
                          );
                        },
                        child: const Text('Thử lại'),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }),
          const SizedBox(height: 30)
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

  @override
  void onDispose() {
    super.onDispose();
    _presenter.onDispose();
    injector.resetLazySingleton<HandleConnectPresenter>();
  }
}
