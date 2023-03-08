import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/app/app_preference.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/generated/assets.dart';

import '../../../../core/app/app_dependency.dart';
import '../../../router/routes.dart';

class SplashScreen extends StatefulWidget {
  final AppPreferences _appPreferences;

  SplashScreen({Key? key})
      : _appPreferences = instance.get(),
        super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _navigation);
  }

  void _navigation() async {
    if (await widget._appPreferences.isUserLoggedIn()) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.dashboard, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.welcomeScreen, (route) => false);
    }
  }

  /*_goNext() async {
    _appPreferences.isUserLoggedIn().then(
          (isUserLoggedIn) => {
        if (isUserLoggedIn)
          {Navigator.pushReplacementNamed(context, Routes.dashboard)}
        else
          {Navigator.pushReplacementNamed(context, Routes.introPages)}
      },
    );
  }*/

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Image.asset(
            Assets.imagesReceptyLogo,
            width: 300.r,
            height: 300.r,
          ),
        ),
      ),
    );
  }
}
