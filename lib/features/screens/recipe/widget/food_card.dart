import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_translator/google_translator.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/components/custom_image.dart';
import 'package:receptyUser/features/components/custom_svg.dart';
import 'package:receptyUser/generated/assets.dart';

class FoodCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? isPremium;
  final String? tutorialLength;
  final String? calorie;
  final VoidCallback? onTap;
  const FoodCard(
      {Key? key,
      this.image,
      this.title,
      this.isPremium,
      this.onTap,
      this.tutorialLength,
      this.calorie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                CustomImage(
                  radius: 10,
                  height: 240.h,
                  width: 180.w,
                  baseUrl: image ??
                      "https://properfoodie.com/wp-content/uploads/2021/04/square-Steak-and-chips-8.jpg",
                ),

                /* Container(
                  height: 240.h,
                  width: 1.sw,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              image??"https://properfoodie.com/wp-content/uploads/2021/04/square-Steak-and-chips-8.jpg"))),
                ),*/
                Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5),
                      child: Container(
                        width: 180.h,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      title ?? "Make steak and chips at home.",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: kRegularLine14.copyWith(
                                          color: Colors.white),
                                    ).translate(),
                                  ),
                                  // Icon(
                                  //   Icons.fav,
                                  //   color: Colors.teal,
                                  // )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, bottom: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      CustomSvg(
                                          icon: Assets.iconsClock,
                                          size: 16.r,
                                          color: Colors.grey),
                                      kWidthBox5,
                                      Expanded(
                                          child: Text(
                                        "${tutorialLength ?? 0} min",
                                        style: kRegularLine14.copyWith(
                                            color: Colors.grey),
                                      ))
                                    ],
                                  )),
                                  /* Row(
                                    children: [
                                      Icon(
                                        Icons.local_fire_department_outlined,
                                        size: 16.r,
                                        color: Colors.grey,
                                      ),
                                      kWidthBox5,
                                      Text(
                                        "${calorie??0} Kcal",
                                        style: kRegularLine14.copyWith(
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),*/
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
          /*Positioned(
              top: 15,
              left: 0,
              child:
              isPremium =="0"?SizedBox():
              RotatedBox(
                quarterTurns: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Premium",
                    style: kRegularLine14.copyWith(color: Colors.grey),
                  ),
                ),
              ))*/
        ],
      ),
    );
  }
}
