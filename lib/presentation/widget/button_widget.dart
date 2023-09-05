  import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.width = double.infinity,
    this.height = 58,
    this.border = 0,
    this.child,
    this.enable = false,
    this.onTap,
    this.color,
    this.colorEnable,
  }) : super(key: key);

  final double width;
  final double height;
  final double border;
  final Widget? child;
  final bool enable;
  final Color? colorEnable;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enable ? onTap : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: enable ? colorEnable : color,
          borderRadius: BorderRadius.circular(border),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
