import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../injection/injector.dart';
import '../../base/base_page.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';
import '../../resources/app_text_styles.dart';
import '../../resources/app_texts.dart';
import '../../routes/app_router.gr.dart';
import 'bloc/register_presenter.dart';
import 'component/confirm_password_form_field.dart';
import 'component/email_form_field.dart';
import 'component/gender_form_field.dart';
import 'component/password_form_field.dart';
import 'component/phone_number_form_field.dart';
import 'component/register_button.dart';
import 'component/username_form_field.dart';

class RegisterPage extends BasePage {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends BasePageState<RegisterPage> {
  final _registerPresenter = injector.get<RegisterPresenter>();

  @override
  Widget buildBody(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.background),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          color: AppColors.blue.withAlpha(160),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  AppImages.logo,
                  width: 150,
                  height: 150,
                ),
                const Text(
                  AppTexts.smartHome,
                  style: AppTextStyles.whiteBold,
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PhoneNumberFormField(
                      presenter: _registerPresenter,
                    ),
                    GenderFormField(
                      presenter: _registerPresenter,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                UsernameFormField(
                  presenter: _registerPresenter,
                ),
                const SizedBox(height: 30),
                EmailFormField(
                  presenter: _registerPresenter,
                ),
                const SizedBox(height: 30),
                PasswordFormField(
                  presenter: _registerPresenter,
                ),
                const SizedBox(height: 30),
                ConfirmPasswordFormField(
                  presenter: _registerPresenter,
                ),
                const SizedBox(height: 80),
                RegisterButton(
                  onTap: onTap,
                  presenter: _registerPresenter,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  bool get resizeToAvoidBottomInset => true;

  Future<void> onTap() async {
    showProgressHud(context);
    if (await _registerPresenter.registerAccount()) {
      await dismissProgressHud();
      if (mounted) {
        await AutoRouter.of(context).push(
          const LoginRoute(),
        );
      }
    } else {
      await dismissProgressHud();
      await Fluttertoast.showToast(
        msg: AppTexts.emailAlreadyInUse,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        fontSize: 20,
      );
    }
  }
}
