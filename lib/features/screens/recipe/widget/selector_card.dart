import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';

class SelectorCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback? onTap;
  final bool isIcon;

  const SelectorCard(
      {Key? key,
      this.title = "",
      this.subTitle = "",
      this.onTap,
      this.isIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width: 1.sw,
          decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: kRegularLine15.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.kBlackColor),
                    ),
                    kHeightBox5,
                    Text(
                      subTitle,
                      style: kRegularLine13.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Color(0XFFA6A6A6),
                      ),
                    ),
                  ],
                ),
              )),
              isIcon
                  ? Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: AppCommonSize.s20,
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
