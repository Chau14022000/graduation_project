import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection/injector.dart';
import '../../../../../utilities/extensions/extensions.dart';
import '../../base/base_page.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';
import '../../resources/app_text_styles.dart';
import '../../resources/app_texts.dart';
import '../../routes/app_router.gr.dart';
import 'bloc/setting_presenter.dart';
import 'bloc/setting_state.dart';
import 'component/dark_button.dart';
import 'component/light_button.dart';

class Setting extends BasePage {
  const Setting({
    Key? key,
  }) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends BasePageState<Setting> {
  final _settingPresenter = injector.get<SettingPresenter>();

  @override
  Color? backgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  void onStateCreated() {
    _settingPresenter.initState();
    super.onStateCreated();
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder<SettingPresenter, SettingState>(
      bloc: _settingPresenter,
      buildWhen: (previous, current) =>
          previous.userEntities != current.userEntities,
      builder: (context, state) => Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.black.withAlpha(200),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppTexts.setting,
                    style: AppTextStyles.size25WhiteBold,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        child: ClipOval(
                          child: _settingPresenter
                                  .state.userEntities.avatar.isNullOrEmpty
                              ? Image.asset(
                                  AppImages.user,
                                  fit: BoxFit.fill,
                                  width: 80,
                                  height: 80,
                                )
                              : Image.network(
                                  _settingPresenter.state.userEntities.avatar!,
                                  fit: BoxFit.fill,
                                  width: 80,
                                  height: 80,
                                ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            AppTexts.hello,
                            style: AppTextStyles.size11While,
                          ),
                          Text(
                            _settingPresenter.state.userEntities.name,
                          )
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          final result = await AutoRouter.of(context).push(
                            const EditProfileRoute(),
                          );
                          if (result == true) {
                            await _settingPresenter.initState();
                          }
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            AppImages.home,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                LightButton(),
                DarkButton(),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                const SizedBox(width: 10),
                const Text(
                  AppTexts.myHome,
                  style: AppTextStyles.size13BlackBold,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(
                      const MyHomeRoute(),
                    );
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: AppColors.grey,
            thickness: 1,
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () => onTap(),
            child: const Text(
              AppTexts.signOut,
              style: AppTextStyles.size20RedBold,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> onTap() async {
    await _settingPresenter.signOut();
    if (mounted) {
      await AutoRouter.of(context).push(
        const LoginRoute(),
      );
    }
  }
}
