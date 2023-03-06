import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/billing_textfield.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/components/custom_svg.dart';
import 'package:receptyUser/features/components/default_btn.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/screens/auth/cubit/auth_cubit.dart';
import 'package:receptyUser/features/screens/auth/view/forget_otp_page.dart';
import 'package:receptyUser/features/screens/dashboard/view/dashboard_screen.dart';
import 'package:receptyUser/generated/assets.dart';


class SignupPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == RegistrationStatus.loading) {
          showProgressDialog();
        } else if (state.status == RegistrationStatus.registrationSuccess) {
          dismissProgressDialog();
          GetContext.to(ForgetOtpPage());
        } else if (state.status == RegistrationStatus.authFail) {
          /* CustomDialog.showUnAuthorisedDialog(
            title: AppStrings.loginAlert.tr(),
            details: AppStrings.loginAlertBody.tr(),
            context: context,
            onYes: () {
              Navigator.pop(context);
            },
          );*/

          dismissProgressDialog();
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
                    CustomSvg(
                      icon: Assets.imagesLoginImage,
                      size: 250.r,
                    ),
                    kHeightBox30,
                    Text(
                      AppStrings.registration.tr(),
                      style: kRegularLine30.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    kHeightBox20,
                    BillingTextField(
                        controller: context.read<AuthCubit>().nameController,
                        labelName: AppStrings.fullName.tr(),
                        hint: ""),
                    kHeightBox20,
                    BillingTextField(
                        controller: context.read<AuthCubit>().regEmailController,
                        labelName: AppStrings.email.tr(),
                        hint: ""),
                    kHeightBox20,
                    BillingTextField(
                        controller: context.read<AuthCubit>().numberController,
                        labelName: AppStrings.phoneNumber.tr(),
                        keyboardType: TextInputType.number,
                        hint: ""),
                    kHeightBox20,
                    BillingTextField(
                        controller: context.read<AuthCubit>().passwordController,
                        labelName: AppStrings.password.tr(),
                        hint: ""),
                    kHeightBox20,
                    BillingTextField(
                        controller: context.read<AuthCubit>().confirmPasswordController,
                        labelName: AppStrings.confirmPassword.tr(),
                        hint: ""),
                    kHeightBox20,
                    SizedBox(
                      width: double.infinity,
                      child: DefaultBtn(
                        buttonHeight: 15.r,
                        radius: 5,
                        title: AppStrings.registration.tr(),
                        onPress: () async {
                          /*if (_formKey.currentState!.validate()) {}*/

                          context.read<AuthCubit>().registration();

                          //GetContext.to(DashboardScreen());
                        },
                      ),
                    ),
                    kHeightBox20,
                    /* Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Don’t have any account? ',
                                style: kRegularLine12.copyWith(
                                    fontWeight: FontWeight.w500, color: Colors.grey)),
                            TextSpan(
                                text: 'Register',
                                style: kRegularLine12.copyWith(
                                    fontWeight: FontWeight.w500, color: Colors.blue),
                                recognizer: DoubleTapGestureRecognizer()
                                  ..onDoubleTap = () {
                                    // Double tapped.
                                  }),
                          ],
                        ),
                      ),
                    )*/
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
