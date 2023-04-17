import 'package:flutter/material.dart';

class AppColors {
  ///main them color
//App primary color
  static const kPrimaryColor = Color(0xFF362B29);
  static const kPrimaryColor2 = Color(0xFF423634);

  //int color: Color(0xFFFF3A27);
//App secondary color
  static const kSecondaryColor =
      Color(0xFFD98F79); //int color: Color(0xFFFF6D27);
//Light theme app background color
  static const kBgColor = Color(0xFFF3F3F3);

//Dark theme app cardColor
  static const kCardDarkColor = Color(0xFF242527);

//Dark theme app background color
  static const kBgDarkColor = Color(0xFF18191B);
  static const kAppBarColor = kWhiteColor;
  static const kStatusBarColor = kWhiteColor;
  static const kStatusBarIcColor = Colors.black;
  static const kCursorColor = Colors.black;
  static const kDividerColor = Color(0xFFA1A1A1);
  static const kLightBlackColor = Color(0xFF1C1C1C);
  static const kHintColor = Color(0xFFA1A1A1);
  static const kBottomNavigationBgColor = Colors.white;
  static const Color kAccentColor = Color(0xffFCAAAB);

  ///end main them color
//app color
  static const kWhiteColor = Colors.white;
  static const kBlackColor = Colors.black;
  static const kBlackColor2 = Color(0xFF242527);
  static const kPaymentStatus = Color(0xFFFFB700);
  static const kFbColors = Color(0xFF2B87FF); //2B87FF / 0065FF
  static const kDarkGrayColor = Color(0xFF4E4E4E);
  static const kDarkGrayColor2 = Color(0xFF7A7A7A);
  static const kDarkGrayColor3 = Color(0xFF9B9B9B);
  static const kGrayIconColor = Color(0xFFA3A3A3);
  static const kOrdinaryColor = Color(0xFFA1A1A1);
  static const kOrdinaryColor2 = Color(0xFFE5E5E5); //E5E5E5 EFEFEF
  static const kOrdinaryColor3 = Color(0xFFEFEFEF); //E5E5E5 EFEFEF
  static const kBackGroundColor = Color(0xFF2A2C36);
  static const kStUnderLineColor = Color(0xFF808080);
  static const kStUnderLineColor2 = Color(0xFF707070);
  static const kDarkColor = Color(0xFF1B1B1B);
  static const kLiteDarkColor = Color(0xFF232323);
  static const kErrorColor = Color(0xFFFF2424);
  static const kSuccessColor = Color(0xFF2EB843);
  static const kSaleColor = Color(0xFFF14705);
  static const kIconColor = Color(0xFFF9784F);
  static const kSubscriptionColor = Color(0xFFF2C822);
  static const kActiveColor = Color(0xFF06B87A);
  static const kInActiveColor = Color(0xFFE05656);
  static const kBreakColor = Color(0xFFFCA345);
  static const kLoginBg = Color(0xFFEEEEEE);

//Order status
  static const completeColor = Color(0xFF49B81F);
  static const inProgressColor = Color(0xff5e6172);
  static const todoColor = Color(0xffd1d2d7);
  static const kPendingColor = Color(0xFF363636);
  static const kDeliveredColor = Color(0xFF49B81F);

//timeLine
  static const kTimelineColor = Color(0xFFFF9E73);

  static final kOrdinaryShadow = BoxShadow(
    color: kOrdinaryColor.withOpacity(.12),
    spreadRadius: 1,
    blurRadius: 1,
    offset: const Offset(0, 1),
  );
}
