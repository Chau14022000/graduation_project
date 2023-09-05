import 'package:flutter/material.dart';

import '../../utilities/extensions/extensions.dart';
import '../resources/app_colors.dart';
import '../resources/app_images.dart';
import '../resources/app_text_styles.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    required this.title,
    required this.width,
    required this.textBottomOne,
    required this.textBottomTwo,
    this.onTap,
    this.onTapIndex,
    this.avatar,
    Key? key,
  }) : super(key: key);

  final String title;
  final double width;
  final String textBottomOne;
  final String textBottomTwo;
  final Function? onTap;
  final String? avatar;
  final Function(int)? onTapIndex;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      title: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.size25WhiteBold,
          ),
          const Spacer(),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 22,
              child: ClipOval(
                child: avatar.isNullOrEmpty
                    ? Image.asset(
                        AppImages.user,
                        fit: BoxFit.fill,
                        width: 80,
                        height: 80,
                      )
                    : Image.network(
                        avatar!,
                        fit: BoxFit.fill,
                        width: 80,
                        height: 80,
                      ),
              ),
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size(0, 60),
        child: Row(
          children: [
            SizedBox(
              width: width,
              child: TabBar(
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 5,
                    color: AppColors.main,
                  ),
                ),
                indicatorColor: AppColors.main,
                tabs: [
                  Tab(
                    text: textBottomOne,
                  ),
                  Tab(
                    text: textBottomTwo,
                  ),
                ],
                onTap: (index) {
                  onTapIndex!(index);
                },
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => onTap!.call() ?? {},
              child: const Icon(
                Icons.add_circle_sharp,
                color: AppColors.main,
                size: 40,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
