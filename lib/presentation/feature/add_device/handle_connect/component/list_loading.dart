import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection/injector.dart';
import '../../../../resources/app_colors.dart';
import '../bloc/handle_connect_presenter.dart';
import '../bloc/handle_connect_state.dart';
import 'text_loading.dart';

class ListLoading extends StatelessWidget {
  ListLoading({Key? key}) : super(key: key);

  final _presenter = injector.get<HandleConnectPresenter>();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HandleConnectPresenter, HandleConnectState>(
        bloc: _presenter,
        buildWhen: (previous, current) =>
            previous.numberDevice != current.numberDevice ||
            previous.finishFind != current.finishFind ||
            previous.finishConnect != current.finishConnect ||
            previous.loading != current.loading ||
            previous.numberDeviceConnected != current.numberDeviceConnected,
        builder: (context, state) => state.loading == LoadingDotType.loading
            ? Column(
                children: [
                  TextLoading(
                    text: state.finishFind == LoadingDotType.fall
                        ? 'Không tìm thấy thiết bị'
                        : state.finishFind == LoadingDotType.success
                            ? 'Tìm thấy ${state.numberDevice} thiết bị'
                            : state.finishFind == LoadingDotType.loading
                                ? 'Đang tìm kiếm thiết bị'
                                : '',
                    dot: state.finishFind,
                  ),
                  const SizedBox(height: 10),
                  TextLoading(
                    text: state.finishConnect == LoadingDotType.fall
                        ? 'Kết nối thất bại'
                        : state.finishConnect == LoadingDotType.success
                            ? 'Kết nối ${state.numberDeviceConnected}'
                                ' thiết bị'
                            : state.finishConnect == LoadingDotType.loading
                                ? 'Đang kết nối với thiết bị'
                                : '',
                    dot: state.finishConnect,
                  ),
                  const SizedBox(height: 10),
                  // const TextLoading(
                  //   text: 'tim thay thiet bi',
                  //   dot: LoadingDotType.success,
                  // ),
                ],
              )
            : Center(
                child: Column(
                  children: const [
                    Text(
                      'Hết thời gian chờ',
                      style: TextStyle(
                        color: AppColors.main,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Vui lòng thử lại',
                      style: TextStyle(
                        color: AppColors.main,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
      );
}
