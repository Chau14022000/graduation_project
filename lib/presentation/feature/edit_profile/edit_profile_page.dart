import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection/injector.dart';
import '../../base/base_page.dart';
import '../../resources/app_text_styles.dart';
import '../../resources/app_texts.dart';
import 'bloc/edit_profile_presenter.dart';
import 'bloc/edit_profile_state.dart';
import 'component/add_image.dart';
import 'component/edit_button.dart';
import 'component/gender_form_field.dart';
import 'component/phone_number_form_field.dart';
import 'component/username_form_field.dart';

class EditProfilePage extends BasePage {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends BasePageState<EditProfilePage> {
  final _editProfilePresenter = injector.get<EditProfilePresenter>();

  @override
  void onStateCreated() {
    _editProfilePresenter.initState();
    super.onStateCreated();
  }

  @override
  Color? backgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder<EditProfilePresenter, EditProfileState>(
      buildWhen: (previous, current) =>
          previous.userEntities != current.userEntities,
      bloc: _editProfilePresenter,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.black.withAlpha(200),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _editProfilePresenter.cancelEdit();
                          AutoRouter.of(context).pop();
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_left_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const Center(
                        child: Text(
                          AppTexts.editProfile,
                          style: AppTextStyles.size13WhileBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: AddImage(
                      editProfilePresenter: _editProfilePresenter,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '${AppTexts.email} : ',
                            style: AppTextStyles.size18WhileBold,
                          ),
                          TextSpan(
                            text:
                                _editProfilePresenter.state.userEntities.email,
                            style: AppTextStyles.size18While,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    UsernameFormField(
                      editProfilePresenter: _editProfilePresenter,
                    ),
                    const SizedBox(height: 20),
                    PhoneNumberFormField(
                      editProfilePresenter: _editProfilePresenter,
                    ),
                    const SizedBox(height: 20),
                    GenderFormField(
                      editProfilePresenter: _editProfilePresenter,
                    ),
                    const SizedBox(height: 150),
                    EditButton(
                      onTap: onTap,
                      editProfilePresenter: _editProfilePresenter,
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> onTap() async {
    showProgressHud(context);
    await _editProfilePresenter.updateAccount();
    await dismissProgressHud();
    if (mounted) {
      await AutoRouter.of(context).pop(true);
    }
  }

  @override
  bool get resizeToAvoidBottomInset => true;
}
