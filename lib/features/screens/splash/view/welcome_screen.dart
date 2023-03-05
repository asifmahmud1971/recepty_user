import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/default_btn.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/screens/auth/view/login_page.dart';
import 'package:receptyUser/generated/assets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Text(
                        AppStrings.welcomeTextUser,
                        textAlign: TextAlign.start,
                        style: kRegularLine20.copyWith(
                            color: Colors.white70, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        AppStrings.welcomeTextDesc,
                        textAlign: TextAlign.start,
                        style: kRegularLine16.copyWith(
                            color: Colors.white60, fontWeight: FontWeight.w500),
                      ),
                    ),
                    kHeightBox10,
                    Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: DefaultBtn(
                        onPress: () {
                          GetContext.to(LoginPage());
                        },
                        radius: 10,
                        btnColor: Colors.teal,
                        title: AppStrings.login.tr(),
                      ),
                    ),
                    kHeightBox10,
                    Container(
                        width: 1.sw,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: DefaultBtn(
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
