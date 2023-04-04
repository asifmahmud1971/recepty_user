import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/default_btn.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/components/payment_controller.dart';
import 'package:receptyUser/features/screens/auth/view/login_page.dart';
import 'package:receptyUser/features/screens/auth/view/signup_page.dart';
import 'package:receptyUser/generated/assets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PaymentController? paymentController;
  final List<String> items = [
    'Slovak',
    'Czech',
    'English'


  ];
  String selectedValue = "Czech";

  @override
  Widget build(BuildContext context) {
    if (context.locale.toString() == "en_US") {
      selectedValue = "English";
    } else if (context.locale.toString() == "cs_CZ") {
      selectedValue = "Czech";
    } else {
      selectedValue = "Slovak";
    }

    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesWelcomeImage),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /*  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Text(
                        AppStrings.welcomeTextUser.tr(),
                        textAlign: TextAlign.start,
                        style: kRegularLine20.copyWith(
                            color: Colors.white70, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        AppStrings.welcomeTextDesc.tr(),
                        textAlign: TextAlign.start,
                        style: kRegularLine16.copyWith(
                            color: Colors.white60, fontWeight: FontWeight.w500),
                      ),
                    ),
                    kHeightBox10,*/
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        AppStrings.preferredLanguage.tr(),
                        textAlign: TextAlign.center,
                        style: kRegularLine16.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        items.length,
                        (index) => InkWell(
                            onTap: () {
                              setState(() {
                                log(context.locale.toString());
                              });
                              if (items[index] == "English") {
                                context.setLocale(Locale('en', 'US'));
                                selectedValue = items[index];
                              } else if (items[index] == "Czech") {
                                context.setLocale(Locale('cs', 'CZ'));
                                selectedValue = items[index];
                              } else {
                                context.setLocale(Locale('sk', 'SK'));
                                selectedValue = items[index];
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: selectedValue == items[index]
                                      ? AppColors.kPrimaryColor
                                      : Colors.white,
                                ),
                                child: Text(
                                  items[index],
                                  style: kRegularLine16.copyWith(
                                      color: selectedValue == items[index]
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            )),
                      ),
                    ),
                    kHeightBox10,
                    Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: DefaultBtn(
                        onPress: () async {
                          //await PaymentController().makePayment();
                          GetContext.to(LoginPage());
                        },
                        radius: 10,
                        title: AppStrings.login.tr(),
                      ),
                    ),
                    kHeightBox10,
                    Container(
                        width: 1.sw,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: DefaultBtn(
                          onPress: () {
                            GetContext.to(SignupPage());
                          },
                          title: AppStrings.registration.tr(),
                          radius: 10,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
