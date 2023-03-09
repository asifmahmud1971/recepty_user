import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/billing_textfield.dart';
import 'package:receptyUser/features/components/custom_dialogs.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/components/custom_svg.dart';
import 'package:receptyUser/features/components/default_btn.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/screens/auth/cubit/auth_cubit.dart';
import 'package:receptyUser/features/screens/dashboard/view/dashboard_screen.dart';
import 'package:receptyUser/generated/assets.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == LoginStatus.loading) {
          showProgressDialog();
        } else if (state.status == LoginStatus.success) {
          dismissProgressDialog();
          GetContext.to(DashboardScreen());
        } else if (state.status == LoginStatus.authFail) {
          showUnAuthorisedDialog(
            title: AppStrings.error.tr(),
            details: AppStrings.loginAlertBody.tr(),
            context: context,
            onYes: () {
              GetContext.back();
            },
          );

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSvg(
                    icon: Assets.imagesLoginImage,
                    size: 250.r,
                  ),
                  kHeightBox30,
                  Text(
                    AppStrings.login.tr(),
                    style: kRegularLine30.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  kHeightBox20,
                  BillingTextField(
                      controller: context.read<AuthCubit>().emailController,
                      labelName: "Email",
                      hint: ""),
                  kHeightBox20,
                  BillingTextField(
                      controller: context.read<AuthCubit>().passwordController,
                      labelName: "Password",
                      hint: ""),
                  kHeightBox20,
                  SizedBox(
                    width: double.infinity,
                    child: DefaultBtn(
                      buttonHeight: 15.r,
                      radius: 5,
                      title: AppStrings.login.tr(),
                      onPress: () async {
                        /*if (_formKey.currentState!.validate()) {}*/

                        context.read<AuthCubit>().login();

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
        );
      },
    );
  }
}
