import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/components/custom_image.dart';
import 'package:receptyUser/generated/assets.dart';

class NewsCard extends StatelessWidget {

  final String? image;
  final String? title;
  final String? description;
  final VoidCallback? onTap;
  const NewsCard({Key? key, this.image, this.title, this.description, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10,right: 10),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(
                radius: 10,
                width: 100.r,
                height: 100.r,
                baseUrl:
                image,
                placeHolder: Assets.imagesPhotoPlaceholder,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                     title??"",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kRegularLine15.copyWith(fontWeight: FontWeight.w600),
                    ),
                    kHeightBox10,
                    Text(
                       description??"",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: kRegularLine15.copyWith(
                          fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
