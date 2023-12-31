import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  factory SplashState({
    required int pageCurrent,
    required PageController pageController,
  }) = _SplashState;

  const SplashState._();

  factory SplashState.initial() => SplashState(
        pageCurrent: 0,
        pageController: PageController(),
      );
}
