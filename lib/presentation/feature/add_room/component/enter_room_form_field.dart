import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../../../widget/text_field_widget.dart';
import '../bloc/add_room_presenter.dart';
import '../bloc/add_room_state.dart';

class EnterRoomFormField extends StatelessWidget {
  const EnterRoomFormField({
    required this.addRoomPresenter,
    Key? key,
  }) : super(key: key);

  final AddRoomPresenter addRoomPresenter;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AddRoomPresenter, AddRoomState>(
        bloc: addRoomPresenter,
        buildWhen: (previous, current) =>
            previous.roomSelector != current.roomSelector,
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: TextFieldWidget(
            top: 0,
            left: 10,
            right: 10,
            cursorColor: AppColors.grey,
            keyboardType: TextInputType.emailAddress,
            fillColor: Colors.transparent,
            style: AppTextStyles.size13BlackBold,
            controller: addRoomPresenter.nameRoomTextEditingController,
            styleBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey,
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      );
}
