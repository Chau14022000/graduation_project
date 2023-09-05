import 'package:flutter/material.dart';

import '../../../../domain/entities/my_home/home/room_entities.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';

class ItemRoom extends StatelessWidget {
  const ItemRoom({
    required this.room,
    Key? key,
  }) : super(key: key);

  final RoomEntities room;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.greyLight,
              blurRadius: 4,
              offset: Offset(3, 7),
            ),
            BoxShadow(
              color: AppColors.greyLight,
              blurRadius: 9,
              offset: Offset(-2, -2),
            ),
          ],
          color: room.status! ? AppColors.main : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              room.covertIcon,
              size: 80,
              color: room.status! ? Colors.white : AppColors.main,
            ),
            const SizedBox(height: 10),
            Text(
              room.nameRoom,
              style: room.status!
                  ? AppTextStyles.size13WhileBold
                  : AppTextStyles.size13BlackBold,
            ),
            Text(
              'x${room.devices?.length ?? 0} Devices',
              style: room.status!
                  ? AppTextStyles.size11While
                  : AppTextStyles.size11Grey,
            )
          ],
        ),
      ),
    );
  }
}
