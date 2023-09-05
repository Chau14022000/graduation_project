import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../injection/injector.dart';
import '../../base/base_page.dart';
import '../../resources/app_text_styles.dart';
import '../../resources/app_texts.dart';
import '../../widget/app_bar_device.dart';
import 'bloc/add_room_presenter.dart';
import 'component/enter_room_form_field.dart';
import 'component/room_grip_view.dart';

class AddRoomPage extends BasePage {
  const AddRoomPage({Key? key}) : super(key: key);

  @override
  AddRoomPageState createState() => AddRoomPageState();
}

class AddRoomPageState extends BasePageState<AddRoomPage> {
  final _addRoomPresenter = injector.get<AddRoomPresenter>();
  @override
  Color? backgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        const Padding(
          padding: EdgeInsets.only(
            left: 30,
          ),
          child: Text(
            AppTexts.enterRoomName,
            style: AppTextStyles.size11GreyBold,
          ),
        ),
        const SizedBox(height: 10),
        EnterRoomFormField(
          addRoomPresenter: _addRoomPresenter,
        ),
        const SizedBox(height: 40),
        const Padding(
          padding: EdgeInsets.only(
            left: 15,
          ),
          child: Text(
            AppTexts.selectRoomByIcon,
            style: AppTextStyles.size11GreyBold,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: RoomGripView(addRoomPresenter: _addRoomPresenter,),
        ),
      ],
    );
  }

  @override
  bool get resizeToAvoidBottomInset => true;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBarDevice(
        title: AppTexts.addRoom,
        textRight: AppTexts.save,
        onTapRight: onTap,
        onTap: () {
          AutoRouter.of(context).pop();
        },
      ),
    );
  }

  Future<void> onTap() async {
    showProgressHud(context);
    await _addRoomPresenter.addRoom();
    await dismissProgressHud();
    if (mounted) {
      await AutoRouter.of(context).pop(true);
    }
  }
}
