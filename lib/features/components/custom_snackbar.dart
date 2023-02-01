import 'package:flutter/material.dart';
import 'package:receptyUser/core/constants/app_colors.dart';

void showCustomSnackBar({
  required BuildContext context,
  String? message,
  bool isError = true,
  bool isCenterText = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message ?? '',
        textAlign: isCenterText ? TextAlign.center : TextAlign.left,
      ),
      margin: const EdgeInsets.all(10),
      backgroundColor:
          isError ? AppColors.kErrorColor : AppColors.kPrimaryColor,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}
