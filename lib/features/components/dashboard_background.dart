import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../generated/assets.dart';

class DashboardBackground extends StatelessWidget {
  final Widget? child;

  const DashboardBackground({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              AppColors.kPrimaryColor.withOpacity(0.1), BlendMode.dstATop),
          image: AssetImage(
            Assets.imagesBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
