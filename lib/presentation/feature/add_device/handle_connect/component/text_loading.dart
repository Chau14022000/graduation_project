import 'package:flutter/material.dart';

import '../../../../resources/app_colors.dart';
import '../bloc/handle_connect_state.dart';

class TextLoading extends StatelessWidget {
  const TextLoading({
    required this.text,
    this.dot = LoadingDotType.loading,
    Key? key,
  }) : super(key: key);

  final String text;
  final LoadingDotType dot;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 100,
          ),
          if (dot == LoadingDotType.loading)
            const SizedBox.square(
              dimension: 10,
              child: CircularProgressIndicator(
                color: AppColors.main,
              ),
            ),
          if (dot == LoadingDotType.fall)
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          if (dot == LoadingDotType.success)
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: dot == LoadingDotType.loading
                  ? AppColors.main
                  : dot == LoadingDotType.fall
                      ? Colors.red
                      : Colors.green,
              fontSize: 15,
            ),
          ),
        ],
      );
}
