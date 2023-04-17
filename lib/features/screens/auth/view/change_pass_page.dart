import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/billing_textfield.dart';
import 'package:receptyUser/features/components/custom_dialogs.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/components/default_btn.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/router/routes.dart';
import 'package:receptyUser/features/screens/auth/cubit/auth_cubit.dart';
import 'package:receptyUser/generated/assets.dart';

class ChangePasswordPage extends StatefulWidget {
  final String? otp;

  ChangePasswordPage({Key? key, this.otp}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String? countryCode = 'CZ';
  int? countryCodeNumber;

  bool check = true;

  void _toggle() {
    setState(() {
      check = !check;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == ChangePass.loading) {
          showProgressDialog();
        } else if (state.status == ChangePass.success) {
          dismissProgressDialog();
          GetContext.offAll(Routes.welcomeScreen);
        } else if (state.status == ChangePass.authFail) {
          /* CustomDialog.showUnAuthorisedDialog(
            title: AppStrings.loginAlert.tr(),
            details: AppStrings.loginAlertBody.tr(),
            context: context,
            onYes: () {
              Navigator.pop(context);
            },
          );*/

          dismissProgressDialog();
        } else if (state.status == ChangePass.invalidToken) {
          showUnAuthorisedDialog(
            title: AppStrings.error.tr(),
            details: "Invalid Token",
            context: context,
            onYes: () {
              Navigator.pop(context);
            },
          );
        } else if (state.status == ChangePass.noUserFound) {
          showUnAuthorisedDialog(
            title: AppStrings.error.tr(),
            details: "No user found",
            context: context,
            onYes: () {
              Navigator.pop(context);
            },
          );
        } else {
          dismissProgressDialog();
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    kHeightBox75,
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        Assets.imagesReceptyLogo,
                        height: 200.r,
                        width: 200.r,
                      ),
                    ),
                    kHeightBox30,
                    Text(
                      AppStrings.forgetPass.tr(),
                      style: kRegularLine30.copyWith(
                          //color: Colors.black,
                          ),
                    ),
                    kHeightBox20,
                    BillingTextField(
                        controller:
                            context.read<AuthCubit>().changePasswordController,
                        labelName: AppStrings.password.tr(),
                        isView: check,
                        suffixIcon: check
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        onPress: () {
                          _toggle();
                        },
                        hint: ""),
                    kHeightBox20,
                    BillingTextField(
                        controller: context
                            .read<AuthCubit>()
                            .changeConfirmPasswordController,
                        labelName: AppStrings.confirmPassword.tr(),
                        isView: check,
                        suffixIcon: check
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        onPress: () {
                          _toggle();
                        },
                        hint: ""),
                    kHeightBox20,
                    SizedBox(
                      width: double.infinity,
                      child: DefaultBtn(
                        buttonHeight: 15.r,
                        btnColor: AppColors.kPrimaryColor2,
                        radius: 5,
                        title: AppStrings.confirm.tr(),
                        onPress: () async {
                          /*if (_formKey.currentState!.validate()) {}*/
                          log(context
                              .read<AuthCubit>()
                              .numberController
                              .value!
                              .international
                              .toString());
                          context.read<AuthCubit>().changePassword();

                          //GetContext.to(DashboardScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
