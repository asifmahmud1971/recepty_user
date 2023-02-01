import 'package:flutter/material.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';

class CustomOutlineBtn extends StatelessWidget {
  final String title;
  final Function? onPress;
  final bool isChange;
  final double radius;
  final double border;
  final Color borderColor;
  final Color textColor;
  final Color btnColor;
  final double? width;
  final TextStyle? textStyle;
  final double height;
  final EdgeInsets? textPadding;
  final bool outlineButton;

  const CustomOutlineBtn({
    Key? key,
    required this.title,
    this.width,
    this.height = 40,
    this.textColor = AppColors.kBlackColor,
    this.btnColor = AppColors.kBlackColor,
    this.borderColor = AppColors.kBlackColor,
    this.border = 0,
    this.onPress,
    this.textStyle,
    this.isChange = false,
    this.outlineButton = false,
    this.radius = 30,
    this.textPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: textStyle ??
            kSmallLine12.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
      ),
      onPressed: onPress as void Function()?,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: btnColor),
          ),
        ),
        padding: MaterialStateProperty.all(
          textPadding ?? const EdgeInsets.all(15),
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            width: 1.0,
            color: btnColor,
          ),
        ),
      ),
    );
  }
}
