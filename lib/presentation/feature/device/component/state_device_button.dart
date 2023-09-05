import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/app_images.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../bloc/device_presenter.dart';
import '../bloc/device_state.dart';

class StateDeviceButton extends StatelessWidget {
  const StateDeviceButton({
    required this.devicePresenter,
    Key? key,
  }) : super(key: key);

  final DevicePresenter devicePresenter;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DevicePresenter, DeviceState>(
        bloc: devicePresenter,
        buildWhen: (previous, current) =>
            previous.deviceEntities != current.deviceEntities,
        builder: (context, state) {
          return Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.deviceEntities.nameDevice,
                        style: AppTextStyles.size18WhileBold,
                      ),
                      const SizedBox(height: 20),
                      if (state.deviceEntities.connectWifi)
                        const Text(
                          AppTexts.online,
                          style: AppTextStyles.size13GreenBold,
                        )
                      else
                        const Text(
                          AppTexts.offline,
                          style: AppTextStyles.size13RedBold,
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: const Alignment(-0.95, -0.95),
                      child: Text(
                        'Đã hoạt động: ${devicePresenter.format(
                          Duration(
                            seconds: state.deviceEntities.timeWork ?? 0,
                          ),
                        )}',
                        style: AppTextStyles.size13MainBold,
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () => devicePresenter.changeStatus(),
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: state.deviceEntities.state
                              ? Image.asset(AppImages.buttonOn)
                              : Image.asset(AppImages.buttonOff),
                        ),
                      ),
                    ),
                    if (!state.deviceEntities.connectWifi)
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black.withAlpha(200),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
              ),
            ],
          );
        },
      );
}
