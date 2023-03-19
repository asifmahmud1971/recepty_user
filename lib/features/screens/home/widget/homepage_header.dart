import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:receptyUser/core/app/app_preference.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/data/network/urls.dart';
import 'package:receptyUser/features/components/custom_image.dart';
import 'package:receptyUser/generated/assets.dart';

import '../../../../core/app/app_dependency.dart';

class HomePageHeader extends StatefulWidget {


  const HomePageHeader({Key? key}) : super(key: key);

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  AppPreferences preferences = instance.get();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              child: GestureDetector(
                onTap: () {
                  //GetContext.to();
                },
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)),
                      child: CustomImage(
                        size: AppCommonSize.s36,
                        isCircle: true,
                        placeHolder: Assets.iconsProfile,
                        baseUrl:
                        Urls.imageUrl+preferences.getUserData()?.user?.profileInformation?.profilePicture,
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello",
                            style: kRegularLine12.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          Text(
                            preferences.getUserData()?.user?.name??"",
                            style: kRegularLine16.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
