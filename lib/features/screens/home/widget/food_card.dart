import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/components/custom_svg.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/screens/product/view/product_item_screen.dart';
import 'package:receptyUser/generated/assets.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GetContext.to(ProductItemScreen());
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  height: 240.h,
                  width: 180.w,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://properfoodie.com/wp-content/uploads/2021/04/square-Steak-and-chips-8.jpg"))),
                ),
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
                                      "Make steak and chips at home.",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: kRegularLine14.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                  Icon(
                                    Icons.bookmark,
                                    color: Colors.teal,
                                  )
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
                                        "30 min",
                                        style: kRegularLine14.copyWith(
                                            color: Colors.grey),
                                      ))
                                    ],
                                  )),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.local_fire_department_outlined,
                                        size: 16.r,
                                        color: Colors.grey,
                                      ),
                                      kWidthBox5,
                                      Text(
                                        "120 Kcal",
                                        style: kRegularLine14.copyWith(
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
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
          Positioned(
              top: 15,
              left: 0,
              child: RotatedBox(
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
              ))
        ],
      ),
    );
  }
}
