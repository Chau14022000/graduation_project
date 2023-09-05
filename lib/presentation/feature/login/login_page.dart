import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../injection/injector.dart';
import '../../base/base_page.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';
import '../../resources/app_text_styles.dart';
import '../../resources/app_texts.dart';
import '../../routes/app_router.gr.dart';
import 'bloc/login_presenter.dart';
import 'component/email_form_field.dart';
import 'component/login_button.dart';
import 'component/new_resident_button.dart';
import 'component/password_form_field.dart';

class LoginPage extends BasePage {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends BasePageState<LoginPage> {
  final _loginPresenter = injector.get<LoginPresenter>();

  @override
  Future<bool> onWillPop() {
    SystemNavigator.pop();
    return super.onWillPop();
  }

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
                Center(
                  child: Image.asset(
                    AppImages.logo,
                    width: 150,
                    height: 150,
                  ),
                ),
                const Text(
                  AppTexts.smartHome,
                  style: AppTextStyles.whiteBold,
                ),
                const SizedBox(height: 30),
                EmailFormField(),
                const SizedBox(height: 30),
                PasswordFormField(),
                const SizedBox(height: 80),
                LoginButton(onTap: onTap),
                const SizedBox(height: 30),
                const NewResidentButton(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<void> onTap() async {
    showProgressHud(context);
    if (await _loginPresenter.login()) {
      await dismissProgressHud();
      if (mounted) {
        await AutoRouter.of(context).push(
          const MyHomeRoute(),
        );
      }
    } else {
      await dismissProgressHud();
      await Fluttertoast.showToast(
        msg: AppTexts.notFound,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        fontSize: 20,
      );
    }
  }

  @override
  bool get resizeToAvoidBottomInset => true;
}
