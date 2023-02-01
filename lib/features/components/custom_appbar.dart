import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:receptyUser/core/constants/app_strings.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppStrings.appName.tr()),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
