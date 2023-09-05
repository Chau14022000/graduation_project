import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../injection/injector.dart';
import '../../../resources/app_colors.dart';
import '../bloc/setting_presenter.dart';
import '../bloc/setting_state.dart';

class LightButton extends StatelessWidget {
  const LightButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _settingPresenter = injector.get<SettingPresenter>();
    return BlocBuilder<SettingPresenter, SettingState>(
      bloc: _settingPresenter,
      buildWhen: (previous, current) => previous.isLight != current.isLight,
      builder: (context, state) => GestureDetector(
        onTap: () {
          _settingPresenter.onTapLight();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 160,
            height: 80,
            color: state.isLight ? Colors.black : AppColors.grey,
            child: Icon(
              Icons.sunny,
              color: state.isLight ? AppColors.main : AppColors.greyLight,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}
