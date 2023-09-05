import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../injection/injector.dart';
import '../../../base/base_page.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_images.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../widget/app_bar_device.dart';
import 'bloc/config_wifi_presenter.dart';
import 'component/add_a_device_button.dart';
import 'component/password_form_field.dart';
import 'component/ssid_form_field.dart';

class ConfigWifiPage extends BasePage {
  const ConfigWifiPage({Key? key}) : super(key: key);

  @override
  _ConfigWifiPageState createState() => _ConfigWifiPageState();
}

class _ConfigWifiPageState extends BasePageState<ConfigWifiPage> {
  final _presenter = injector.get<ConfigWifiPresenter>();

  @override
  void onStateCreated() {
    super.onStateCreated();
    _presenter.onStateCreated(context);
  }

  @override
  Color? backgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              AppTexts.pleasePairingMode,
              style: AppTextStyles.size13BlackBoldDF,
            ),
            const SizedBox(height: 5),
            const Text(
              AppTexts.chooseWifi,
              style: AppTextStyles.size13GreyBoldDF,
            ),
            const SizedBox(height: 30),
            Image.asset(
              AppImages.chooseWifi,
              width: 1000,
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => _presenter.useCurrentWifi(context),
              child: Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: const Text(
                  'Use Current Wifi',
                  style: TextStyle(
                    color: AppColors.main,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            SSIDFormField(),
            const SizedBox(height: 40),
            PasswordFormField(),
            const SizedBox(height: 40),
            AddADeviceButton(),
            const SizedBox(height: 40),
            // AddMoreDeviceButon(),
          ],
        ),
      ),
    );
  }

  @override
  bool get resizeToAvoidBottomInset => true;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBarDevice(
        title: AppTexts.addDevice,
        onTap: () {
          AutoRouter.of(context).pop();
        },
      ),
    );
  }
}
