import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/splash/page_entities.dart';
import '../../../../domain/use_cases/user/get_access_token_use_case.dart';
import 'splash_state.dart';

class SplashPresenter extends Cubit<SplashState> {
  SplashPresenter(
    this._getAccessTokenUseCase, {
    @visibleForTesting SplashState? state,
  }) : super(
          state ?? SplashState.initial(),
        );
  final GetAccessTokenUseCase _getAccessTokenUseCase;

  final listPage = listPageSplash;

  void changePageCurrent(index) {
    emit(
      state.copyWith(pageCurrent: index),
    );
  }

  void onTapSkip() {
    emit(
      state.copyWith(
        pageCurrent: listPage.length - 1,
        pageController: state.pageController..jumpToPage(2),
      ),
    );
  }

  void onTapNext() {
    emit(
      state.copyWith(
        pageCurrent: state.pageCurrent + 1,
        pageController: state.pageController
          ..jumpToPage(
            state.pageCurrent + 1,
          ),
      ),
    );
  }

  bool checkAccount() {
    if (_getAccessTokenUseCase.run() == null) {
      return false;
    }
    return true;
  }
}
