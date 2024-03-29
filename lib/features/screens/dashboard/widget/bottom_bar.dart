import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_colors.dart';

class CustomBottomBar extends StatelessWidget {
  final List<Widget>? children;

  const CustomBottomBar({Key? key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 60,right: 60, bottom: 30),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.kSecondaryColor.withOpacity(0.7)),
            child: Row(
              children: children!,
            ),
          ),
        ),
      ],
    );
  }
}
