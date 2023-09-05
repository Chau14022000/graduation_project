import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utilities/helpers/logger_helper/logger_permission.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_images.dart';
import '../bloc/edit_profile_presenter.dart';
import '../bloc/edit_profile_state.dart';

class AddImage extends StatelessWidget {
  const AddImage({
    required this.editProfilePresenter,
    Key? key,
  }) : super(key: key);

  final EditProfilePresenter editProfilePresenter;

  @override
  Widget build(BuildContext context) {
    String? pathImage;
    return BlocBuilder<EditProfilePresenter, EditProfileState>(
      buildWhen: (previous, current) => previous.pathImage != current.pathImage,
      bloc: editProfilePresenter,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            children: [
              ClipOval(
                child: state.pathImage != null
                    ? Image.file(
                        width: 120,
                        height: 120,
                        fit: BoxFit.fill,
                        File(
                          state.pathImage!,
                        ),
                      )
                    : state.userEntities.avatar != null
                        ? Image.network(
                            state.userEntities.avatar!,
                            width: 120,
                            height: 120,
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            width: 120,
                            fit: BoxFit.fitHeight,
                            height: 120,
                            AppImages.user,
                          ),
              ),
              GestureDetector(
                onTap: () async {
                  pathImage = await openBottomSheet(context);
                  editProfilePresenter.resetImage(pathImage);
                },
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> openBottomSheet(BuildContext context) async {
    final loggerPermission = LoggerPermission.instance;
    String? path;
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (contextBt) {
        return SizedBox(
          height: 149,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  path = await loggerPermission
                      .isCheckPermissionLibrary()
                      .whenComplete(
                        () => Navigator.of(contextBt).pop(),
                      );
                },
                child: const Icon(
                  Icons.image,
                  color: AppColors.main,
                  size: 50,
                ),
              ),
              const SizedBox(width: 99),
              GestureDetector(
                onTap: () async {
                  path = await loggerPermission
                      .isCheckPermissionCamera()
                      .whenComplete(
                        () => Navigator.of(contextBt).pop(),
                      );
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: AppColors.main,
                  size: 50,
                ),
              ),
            ],
          ),
        );
      },
    );
    return path;
  }
}
