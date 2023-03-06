import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/components/custom_svg.dart';
import 'package:receptyUser/features/router/routes.dart';
import 'package:receptyUser/features/screens/auth/cubit/auth_cubit.dart';
import 'package:receptyUser/generated/assets.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../components/custom_dialogs.dart';
import '../../../components/custom_snackbar.dart';

class ForgetOtpPage extends StatefulWidget {
  ForgetOtpPage({Key? key}) : super(key: key);

  @override
  State<ForgetOtpPage> createState() => _ForgetOtpPageState();
}

class _ForgetOtpPageState extends State<ForgetOtpPage> {
  Timer? _timer;
  int _limit = 120;
  int _start = 120;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

 /* resendOtp() async {
    bool isSuccess = await context.read<AuthCubit>().;
    if (isSuccess) {
      startTimer();
    }
  }
*/
  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _timer!.cancel();
            _start = _limit;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
          width:  1.sw,
          margin: EdgeInsets.symmetric(vertical: 100.h,horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor2,
            borderRadius: BorderRadius.circular(32)
               ,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              CustomSvg(
                size: kIsWeb ? AppCommonSize.s150 : AppCommonSize.s60,
                icon: Assets.imagesReceptyLogo,
              ),
              kHeightBox50,
              otpWidget(context),
              kHeightBox50

            ],
          ),
        ),
      ),
    );
  }

  otpWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Put here provided otp",
            style: kRegularLine20.copyWith(
                color:  Colors.white,
                fontWeight: FontWeight.w700),
          ),
          kHeightBox30,
          Text(
            "Enter Code",
            style: kRegularLine16.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          kHeightBox5,
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.status == ForgotStatus.otpLoading) {
                showProgressDialog();
              } else if (state.status == ForgotStatus.otpFailed) {
                dismissProgressDialog();
                Navigator.pop(context);

                showCustomSnackBar(
                    context: context,
                    message: "failed");
              } else if (state.status == ForgotStatus.otpSuccess) {
                dismissProgressDialog();
                Navigator.pop(context);
               /* Navigator.pushReplacementNamed(
                    context, Routes.forgotPasswordPage);*/
              }
            },
            builder: (context, state) {
              return PinFieldAutoFill(
                controller: context.read<AuthCubit>().otpController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: BoxLooseDecoration(
                  textStyle: kRegularLine18.copyWith(
                    color: AppColors.kPrimaryColor,
                    fontWeight: boldFont,
                  ),
                  radius: const Radius.circular(8),
                  bgColorBuilder:
                       FixedColorBuilder(AppColors.kWhiteColor),
                  strokeColorBuilder: FixedColorBuilder(
                    state.status == ForgotStatus.otpFailed
                        ? Colors.red
                        : Colors.transparent,
                  ),
                ),
                codeLength: 5,
                currentCode: context.read<AuthCubit>().otpController.text,
                onCodeChanged: (code) {
                  if (code!.length == 5) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    /*context.read<AuthCubit>().forgotBody = context
                        .read<ForgotCubit>()
                        .forgotBody
                        ?.copyWith(
                            otp:
                                context.read<ForgotCubit>().otpController.text);
                    context.read<ForgotCubit>().forgotOTPSubmit();*/
                  }
                },
              );
            },
          ),
          kHeightBox20,
        /*  SizedBox(
            width: double.infinity,
            child: CustomButton(
              icon: AppImages.iconsReplay,
              isIconEnable: true,
              btnColor: _start != _limit
                  ? AppColors.kDarkGrayColor3
                  : AppColors.kPrimaryColorOneOne,
              radius: 8.r,
              title: AppStrings.resentOtp.tr(),
              onPress: _start == _limit
                  ? () async {
                      bool isSuccess = await context
                          .read<ForgotCubit>()
                          .forgotInit(resendOtp: true);
                      log(isSuccess.toString());
                      if (isSuccess) {
                        startTimer();
                      }
                    }
                  : null,
            ),
          ),*/
          kHeightBox20,
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: TextButton.icon(
              onPressed: () async {
                await context.read<AuthCubit>().resetControllers();
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.login, (route) => false);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.kDarkGrayColor3,
              ),
              label: Text(
                "back to login",
                style: kRegularLine18.copyWith(
                    color: AppColors.kDarkGrayColor3,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
