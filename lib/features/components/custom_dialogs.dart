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

showUnAuthorisedDialog({
  required BuildContext context,
  required Function() onYes,
  String? title,
  String? details,
  String? confirmText,
  String? cancelText,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppCommonSize.s10)),
        //this right here
        child: IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.only(top: AppCommonSize.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title ?? 'Unauthorised',
                  style: kRegularLine16.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: AppTextSize.s16,
                  ),
                ),
                kHeightBox8,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    details ??
                        'You need to sign in or sign up before continuing.',
                    textAlign: TextAlign.center,
                    style: kRegularLine16.copyWith(
                      color: Color(0XFF535353),
                      fontSize: AppTextSize.s14,
                    ),
                  ),
                ),
                kHeightBox20,
                Divider(
                  height: 0,
                ),
                TextButton(
                  onPressed: onYes,
                  child: Text(
                    "Ok",
                    style:
                        kRegularLine16.copyWith(color: AppColors.kPrimaryColor),
                  ),
                ),
                VerticalDivider(),
              ],
            ),
          ),
        ),
      );
    },
  );
}
