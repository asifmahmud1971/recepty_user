import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/components/custom_image.dart';
import 'package:receptyUser/generated/assets.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({Key? key}) : super(key: key);

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
                            "https://miro.medium.com/max/1400/0*0fClPmIScV5pTLoE.jpg",
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
                            "John Doe",
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
