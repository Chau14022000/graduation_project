import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.top,
    this.right = 20,
    this.left = 40,
    Key? key,
    this.width = double.infinity,
    this.controller,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.errorText,
    this.isPassWord = false,
    this.iconLeft,
    this.keyboardType,
    this.maxLength,
    this.cursorColor,
    this.errorStyle,
    this.fillColor,
    this.styleBorder,
    this.textStyle,
    this.trueStyle,
    this.prefixIcon,
    this.maxLines = 1,
    this.style,
  }) : super(key: key);

  final double width;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final Widget? iconLeft;
  final TextInputType? keyboardType;
  final bool isPassWord;
  final int? maxLength;
  final Color? cursorColor;
  final Color? fillColor;
  final TextStyle? errorStyle;
  final TextStyle? trueStyle;
  final TextStyle? textStyle;
  final TextStyle? style;
  final InputBorder? styleBorder;
  final double top;
  final double left;
  final double right;
  final Widget? prefixIcon;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        style: style,
        textAlignVertical: TextAlignVertical.top,
        cursorColor: cursorColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: left,
            top: top,
            bottom: top,
            right: right,
          ),
          counterText: '',
          focusedErrorBorder: styleBorder,
          focusedBorder: styleBorder,
          errorBorder: styleBorder,
          enabledBorder: styleBorder,
          disabledBorder: styleBorder,
          filled: true,
          fillColor: fillColor,
          errorText: errorText,
          errorStyle: errorStyle,
          hintText: hintText,
          hintStyle: textStyle,
          labelText: labelText,
          labelStyle: textStyle,
          floatingLabelStyle: errorText == null ? trueStyle : errorStyle,
          suffixIcon: iconLeft,
          prefixIcon: prefixIcon,
        ),
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: isPassWord,
        maxLength: maxLength,
        maxLines: maxLines,
      ),
    );
  }
}
