import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection/injector.dart';
import '../../../../resources/app_text_styles.dart';
import '../../../../resources/app_texts.dart';
import '../../../../widget/button_widget.dart';
import '../bloc/config_wifi_presenter.dart';
import '../bloc/config_wifi_state.dart';

class AddMoreDeviceButon extends StatelessWidget {
  AddMoreDeviceButon({Key? key}) : super(key: key);

  final _presenter = injector.get<ConfigWifiPresenter>();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ConfigWifiPresenter, ConfigWifiState>(
        bloc: _presenter,
        buildWhen: (previous, current) =>
            previous.statusButton != current.statusButton,
        builder: (context, state) => ButtonWidget(
          colorEnable: Colors.amber,
          color: Colors.grey,
          border: 10,
          enable: state.statusButton,
          onTap: () => _presenter.onTapAddMoreDevice(context),
          child: const Text(
            AppTexts.addMoreDevice,
            style: AppTextStyles.whiteBold,
          ),
        ),
      );
}
