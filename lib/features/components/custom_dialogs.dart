import 'package:flutter/material.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/components/my_context.dart';

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
            padding: EdgeInsets.only(top: AppCommonSize.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title ?? '',
                  style: kRegularLine16.copyWith(
                    color: AppColors.kBlackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: AppTextSize.s20,
                  ),
                ),
                kHeightBox8,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppWeight.s10),
                  child: Text(
                    details ?? '',
                    style: kRegularLine16.copyWith(
                      color: AppColors.kBlackColor,
                      fontSize: AppTextSize.s16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                kHeightBox20,
                Divider(
                  height: 0,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            GetContext.back();
                          },
                          child: Text(
                            "No",
                            style: kRegularLine16.copyWith(
                                color: AppColors.kSecondaryColor),
                          ),
                        ),
                      ),
                      VerticalDivider(),
                      Expanded(
                        child: TextButton(
                          onPressed: onYes,
                          child: Text(
                            "Yes",
                            style: kRegularLine16.copyWith(
                                color: AppColors.kPrimaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      //color: Color(0XFF535353),
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
                        kRegularLine16.copyWith(
                          color: Colors.red,
                        ),
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
