import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:receptyUser/core/constants/app_size.dart';

import '../../core/constants/app_colors.dart';

class CustomLoader extends StatelessWidget {
  final bool isOverlay;

  const CustomLoader({
    Key? key,
    this.isOverlay = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: isOverlay
          ? Container(
              height: AppCommonSize.s100,
              width: AppCommonSize.s100,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: SpinKitPouringHourGlass(
                duration: Duration(milliseconds: 1500),
                size: AppCommonSize.s40,
                color: AppColors.kPrimaryColor,
              ),
            )
          : SpinKitPouringHourGlass(
              duration: Duration(milliseconds: 1500),
              size: AppCommonSize.s40,
              color: AppColors.kPrimaryColor,
            ),
    );
  }
}
