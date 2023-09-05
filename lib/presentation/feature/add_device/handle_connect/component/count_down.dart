import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection/injector.dart';
import '../../../../resources/app_colors.dart';
import '../bloc/handle_connect_presenter.dart';
import '../bloc/handle_connect_state.dart';

class CountDown extends StatelessWidget {
  CountDown({Key? key}) : super(key: key);

  final _presenter = injector.get<HandleConnectPresenter>();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HandleConnectPresenter, HandleConnectState>(
        bloc: _presenter,
        buildWhen: (previous, current) => previous.counter != current.counter,
        builder: (context, state) => Text(
          state.counter.toString(),
          style: const TextStyle(
            color: AppColors.main,
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
      );
}
