import 'package:flutter/material.dart';
import 'package:receptyUser/features/components/custom_svg.dart';

bottomBarItem(
    {String? icon,
    VoidCallback? onTap,
    Color? iconColor,
    bool isBorder = false}) {
  return Expanded(
      child: InkWell(
    onTap: onTap,
    child: Center(
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: isBorder ? Border.all(color: Colors.white, width: 1) : null,
            borderRadius: BorderRadius.circular(10)),
        child: CustomSvg(
          icon: icon!,
          color: iconColor,
        ),
      ),
    ),
  ));
}
