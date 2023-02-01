import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/custom_svg.dart';

import '../../../../generated/assets.dart';

class DashboardCardBottomCurve extends StatelessWidget {
  const DashboardCardBottomCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, right: 30.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              bottom: -150,
              right: -30,
              child: RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(
                    Assets.imagesBottomFood,
                    height: 200.r,
                    width: 300.r,
                  ))),
          Container(
            width: 1.sw,
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                width: 1.sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kPrimaryColor.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(5, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)),
                            child:
                                CustomSvg(icon: Assets.iconsView, size: 50.r))),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.todayView.tr(),
                          style: kRegularLine20.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.kPrimaryColor),
                        ),
                        Text(
                          "500",
                          style: kRegularLine20.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.kPrimaryColor2),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
