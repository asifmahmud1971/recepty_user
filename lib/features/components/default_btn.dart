import 'package:flutter/material.dart';
import 'package:receptyUser/features/components/custom_svg.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_size.dart';

class DefaultBtn extends StatelessWidget {
  final String title;
  final Function? onPress;
  final bool isCenter;
  final double radius;
  final double? buttonHeight;
  final double border;
  final Color borderColor;
  final Color textColor;
  final Color btnColor;
  final TextStyle? textStyle;
  final double textPadding;
  final bool outlineButton;
  final bool isIconEnable;
  final String? icon;
  final double? iconSize;

  const DefaultBtn({
    Key? key,
    required this.title,
    this.textColor = Colors.white,
    this.btnColor = AppColors.kPrimaryColor,
    this.borderColor = AppColors.kPrimaryColor,
    this.border = 0,
    this.onPress,
    this.textStyle,
    this.outlineButton = false,
    this.isCenter = true,
    this.isIconEnable = false,
    this.icon,
    this.radius = 30.0,
    this.textPadding = 15,
    this.iconSize,
    this.buttonHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isIconEnable
        ? TextButton(
            onPressed: onPress as void Function()?,
            style: ButtonStyle(
              padding:
                  MaterialStateProperty.all(EdgeInsets.all(AppCommonSize.s10)),
              backgroundColor: MaterialStateProperty.all(btnColor),
              elevation: MaterialStateProperty.all(0.0),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(
                    width: outlineButton ? 1 : border,
                    color: outlineButton
                        ? borderColor
                        : border == 0
                            ? Colors.transparent
                            : borderColor,
                  ),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment:
                  isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                CustomSvg(icon: icon!, size: iconSize ?? AppCommonSize.s24),
                kWidthBox8,
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: textStyle ??
                      kRegularLine16.copyWith(
                        fontSize: AppTextSize.s18,
                        color: outlineButton ? textColor : textColor,
                        fontWeight: boldFont,
                      ),
                ),
              ],
            ),
          )
        : TextButton(
            onPressed: onPress as void Function()?,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.all(buttonHeight ?? AppCommonSize.s18)),
              backgroundColor: MaterialStateProperty.all(btnColor),
              elevation: MaterialStateProperty.all(0.0),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(
                    width: outlineButton ? 1 : border,
                    color: outlineButton
                        ? borderColor
                        : border == 0
                            ? Colors.transparent
                            : borderColor,
                  ),
                ),
              ),
            ),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: textStyle ??
                  kRegularLine16.copyWith(
                    fontSize: AppTextSize.s18,
                    color: outlineButton ? textColor : textColor,
                    fontWeight: boldFont,
                  ),
            ),
          );
  }
}
