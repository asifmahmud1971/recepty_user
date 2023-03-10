import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/components/custom_image.dart';
import 'package:receptyUser/generated/assets.dart';

class DottedButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? fileName;
  final bool? isUrl;

  const DottedButton({Key? key, this.onTap, this.fileName, this.isUrl = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
      child: InkWell(
        onTap: onTap ?? () {},
        child: DottedBorder(
            radius: Radius.circular(5),
            borderType: BorderType.RRect,
            strokeWidth: 0.5,
            child: Container(
              height: 150.r,
              width: 150.r,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: fileName != null
                  ? Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: isUrl!
                            ? CustomImage(
                                placeHolder: Assets.imagesPhotoPlaceholder,
                                baseUrl: fileName ?? "",
                              )
                            : Image.file(
                                File(fileName ?? ""),
                                fit: BoxFit.cover,
                              ),
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.kPrimaryColor,
                        ),
                        Text(
                          "Attach\nReceipts",
                          textAlign: TextAlign.center,
                          style: kRegularLine8.copyWith(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
            )),
      ),
    );
  }
}
