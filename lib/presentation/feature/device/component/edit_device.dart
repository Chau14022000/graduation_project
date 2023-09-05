import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../domain/entities/my_home/home/device_entities.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_images.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../bloc/device_presenter.dart';
import 'room_form_field.dart';

class EditDevice extends StatelessWidget {
  const EditDevice({
    required this.device,
    required this.devicePresenter,
    Key? key,
  }) : super(key: key);

  final DevicePresenter devicePresenter;
  final DeviceEntities device;

  @override
  Widget build(BuildContext context) {


    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      contentPadding: const EdgeInsets.only(top: 10),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'EDIT DEVICE',
              style: AppTextStyles.size18BlackBold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.grey,
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 30),
              child: TextField(
                controller: devicePresenter.nameDevice,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  border: InputBorder.none,
                ),
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Chọn phòng',
                    style: AppTextStyles.size13GreyBold,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RoomFormField(devicePresenter: devicePresenter,),
                  ),
                ],
              ),
            ),
            Center(
              child: QrImage(
                data: device.id,
                version: QrVersions.auto,
                size: 200,
                embeddedImage: const ExactAssetImage(
                  AppImages.iconLauncher,
                  scale: 1.5,
                ),
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: const Size(30, 30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () async {
                await devicePresenter.saveDevice();
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                decoration: const BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: const Text(
                  AppTexts.save,
                  style: AppTextStyles.size18WhileBold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
