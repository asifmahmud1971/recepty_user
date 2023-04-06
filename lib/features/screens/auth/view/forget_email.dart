import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/billing_textfield.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/components/default_btn.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/screens/auth/cubit/auth_cubit.dart';
import 'package:receptyUser/features/screens/auth/view/reg_otp_page.dart';
import 'package:receptyUser/features/screens/auth/view/forget_pass_otp.dart';
import 'package:receptyUser/features/screens/auth/view/signup_page.dart';
import 'package:receptyUser/generated/assets.dart';

class ForgetEmailPage extends StatefulWidget {
  const ForgetEmailPage({Key? key}) : super(key: key);

  @override
  State<ForgetEmailPage> createState() => _ForgetEmailPageState();
}

class _ForgetEmailPageState extends State<ForgetEmailPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state.status==ForgotStatus.loading){
          showProgressDialog();
        }else if(state.status==ForgotStatus.success){
          GetContext.to(ForgetPassOtpPage());
          dismissProgressDialog();
        }else{
          dismissProgressDialog();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      AppStrings.forgetPass.tr(),
                      style: kRegularLine30.copyWith(
                      ),
                    ),
                    kHeightBox20,
                    BillingTextField(
                        controller: context
                            .read<AuthCubit>()
                            .forgotEmailController,
                        labelName: "Email",
                        hint: ""),
                    kHeightBox20,
                    SizedBox(
                      width: double.infinity,
                      child: DefaultBtn(
                        buttonHeight: 15.r,
                        radius: 5,
                        title: AppStrings.confirm.tr(),
                        onPress: () async {
                          /*if (_formKey.currentState!.validate()) {}*/

                          context.read<AuthCubit>().forgot();

                          //GetContext.to(DashboardScreen());
                        },
                      ),
                    ),
                    kHeightBox10,
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
