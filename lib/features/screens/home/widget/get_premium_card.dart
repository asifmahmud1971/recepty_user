import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/gradiant_text.dart';
import 'package:receptyUser/generated/assets.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationX(math.pi),
              child: Image.asset(Assets.imagesOrgament)),
         /* Container(
            width: 1.sw,
            padding: const EdgeInsets.only(left: 10, top: 10,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GradientText(
                        AppStrings.promoText.tr(),
                        style: kRegularLine24.copyWith(
                            color: Colors.white,
                            fontFamily: GoogleFonts.almarai().fontFamily),
                        gradient: LinearGradient(colors: [
                          Colors.red.shade400,
                          Colors.yellow.shade900,
                          Colors.yellow.shade900,
                        ]),
                      ),
                      kHeightBox10,
                      Text(
                        AppStrings.welcomeTextDesc.tr(),
                        style: kRegularLine18.copyWith(
                            color: Colors.white,
                            fontFamily: GoogleFonts.abel().fontFamily),
                      ),
                      *//* kHeightBox30,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Text(
                          "Start 7-day free trial",
                          style: kRegularLine18.copyWith(
                              color: Colors.black,
                              fontFamily: GoogleFonts.abel().fontFamily),
                        ),
                      )*//*
                    ],
                  ),
                ),
                SizedBox(
                    height: 130.r,
                    width: 150.r,
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Image.asset(Assets.imagesFoodInHand)))
              ],
            ),
          ),*/
         // Image.asset(Assets.imagesOrgament)
        ],
      ),
    );
  }
}
