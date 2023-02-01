import 'package:flutter/material.dart';
import 'package:receptyUser/core/constants/app_size.dart';

import '../../core/constants/app_colors.dart';
import 'default_btn.dart';

showCustomDialog({
  required BuildContext context,
  required Function() onYes,
  String? title,
  String? details,
  String? confirmText,
  String? cancelText,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppCommonSize.s10)),
        //this right here
        child: IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.all(AppCommonSize.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: kRegularLine16.copyWith(
                    color: AppColors.kBlackColor,
                    fontSize: AppTextSize.s20,
                  ),
                ),
                kHeightBox8,
                Text(
                  details ?? '',
                  style: kRegularLine16.copyWith(
                    color: AppColors.kBlackColor,
                    fontSize: AppTextSize.s16,
                  ),
                ),
                kHeightBox25,
                Row(
                  children: [
                    Expanded(
                      child: DefaultBtn(
                        onPress: () {
                          Navigator.of(context).pop();
                          onYes();
                        },
                        title: confirmText ?? 'Yes',
                      ),
                    ),
                    kWidthBox12,
                    Expanded(
                      child: DefaultBtn(
                        onPress: () => Navigator.of(context).pop(),
                        title: cancelText ?? 'No',
                        outlineButton: true,
                        textColor: AppColors.kBlackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
