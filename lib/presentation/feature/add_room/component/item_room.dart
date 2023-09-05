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
    return Column(
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: room.status! ? AppColors.main : AppColors.greyLight,
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Icon(
            room.covertIcon,
            size: 50,
            color: room.status! ? Colors.white : AppColors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          room.nameRoom,
          style: room.status!
              ? AppTextStyles.size13MainBold
              : AppTextStyles.size13BlackBold,
        )
      ],
    );
  }
}
