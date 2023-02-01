import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/components/custom_svg.dart';

class SquareCard extends StatelessWidget {
  final String? title;
  final String? value;
  final String? icon;

  const SquareCard({Key? key, this.title, this.value, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, right: 30.w),
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            width: 1.sw,
            decoration: BoxDecoration(
              color: Colors.white,
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
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        child: CustomSvg(icon: icon!, size: 50.r))),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: kRegularLine20.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.kPrimaryColor,
                          fontFamily: GoogleFonts.aBeeZee().fontFamily),
                    ),
                    Text(
                      value!,
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
    );
  }
}
