import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/billing_textfield.dart';
import 'package:receptyUser/features/components/country_picker_textfield.dart';
import 'package:receptyUser/features/components/custom_dialogs.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/components/custom_svg.dart';
import 'package:receptyUser/features/components/default_btn.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/screens/auth/cubit/auth_cubit.dart';
import 'package:receptyUser/features/screens/auth/view/forget_otp_page.dart';
import 'package:receptyUser/features/screens/auth/view/login_page.dart';
import 'package:receptyUser/features/screens/dashboard/view/dashboard_screen.dart';
import 'package:receptyUser/generated/assets.dart';



class SignupPage extends StatefulWidget {


  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
        if (state.status == RegistrationStatus.loading) {
          showProgressDialog();
        } else if (state.status == RegistrationStatus.registrationSuccess) {
          dismissProgressDialog();
          GetContext.to(ForgetOtpPage(registrationUser: state.registrationResponse?.user,));
        } else if (state.status == RegistrationStatus.taken) {
          showUnAuthorisedDialog(
            title: AppStrings.error.tr(),
            details: AppStrings.emailTaken.tr(),
            context: context,
            onYes: () {
              Navigator.pop(context);
            },
          );

          dismissProgressDialog();
        }
        else if (state.status == RegistrationStatus.authFail) {
          /* CustomDialog.showUnAuthorisedDialog(
            title: AppStrings.loginAlert.tr(),
            details: AppStrings.loginAlertBody.tr(),
            context: context,
            onYes: () {
              Navigator.pop(context);
            },
          );*/

          dismissProgressDialog();
        }


        else {
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
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.asset(Assets.imagesReceptyLogo,
                        height: 200.r,
                        width: 200.r,
                      ),
                    ),
                    kHeightBox30,
                    Text(
                      AppStrings.registration.tr(),
                      style: kRegularLine30.copyWith(
                        //color: Colors.black,
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
                    /*kHeightBox20,
                    CountryPickerTextField(
                      labelName: AppStrings.phoneNumber.tr(),
                      textEditingController: context.read<AuthCubit>().numberController,
                      keyboardType: TextInputType.phone,
                      numberPicker: CountryCodePicker(
                        flagWidth: 24.r,
                        flagDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2)),
                        onChanged: (value) {
                          setState(() {
                            countryCode = value.code;
                            print(value);
                          });
                        },
                        textStyle: const TextStyle(color: Colors.grey),
                        initialSelection: countryCode,
                        //favorite: ['+41', countryCode.toString()],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                      prefixIconColor: Colors.white.withOpacity(0.3),
                      hint: "11 111 11 11",
                      hintColor: Colors.grey,
                    ),*/
                    kHeightBox20,
                    BillingTextField(
                        controller: context.read<AuthCubit>().regPasswordController,
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
                        controller: context.read<AuthCubit>().confirmPasswordController,
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
                        radius: 5,
                        title: AppStrings.registration.tr(),
                        onPress: () async {
                          /*if (_formKey.currentState!.validate()) {}*/
                          log(context.read<AuthCubit>().numberController.value!.international.toString());
                          context.read<AuthCubit>().registration();

                          //GetContext.to(DashboardScreen());
                        },
                      ),
                    ),
                    kHeightBox20,
                     Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: AppStrings.alreadyHaveAccount.tr(),
                                style: kRegularLine14.copyWith(
                                    fontWeight: FontWeight.w500, color: Colors.grey)),
                            TextSpan(
                                text: AppStrings.login.tr(),
                                style: kRegularLine14.copyWith(
                                    fontWeight: FontWeight.w500, color: Colors.blue),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                GetContext.to(LoginPage());
                              },),
                          ],
                        ),
                      ),
                    )
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
