import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/components/custom_image.dart';
import 'package:receptyUser/generated/assets.dart';

class CategoryCard extends StatelessWidget {
  final String? image;
  final String? name;
  final VoidCallback?onTap;
  const CategoryCard({Key? key, this.image, this.name, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            CustomImage(
              radius: 10,
              width: 100.r,
              height: 100.r,
              baseUrl:
                  image,
              placeHolder: Assets.imagesPhotoPlaceholder,
            ),

            kHeightBox10,
            Text(name??"",
                style: kRegularLine16.copyWith(
                    fontWeight: FontWeight.w500, color: Colors.teal))
          ],
        ),
      ),
    );
  }
}
