import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../routes/app_router.gr.dart';
import '../../../widget/button_widget.dart';

class NewResidentButton extends StatelessWidget {
  const NewResidentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          AutoRouter.of(context).push(
            const RegisterRoute(),
          );
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: ButtonWidget(
            colorEnable: Colors.black,
            border: 10,
            enable: true,
            child: Text(
              AppTexts.newResident,
              style: AppTextStyles.whiteBold,
            ),
          ),
        ),
      );
}
