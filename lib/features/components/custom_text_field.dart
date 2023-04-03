import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/screens/theme/cubit/theme_cubit.dart';

import '../../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onPress;
  final Function(String)? onChanged;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? textColor;
  final Color? fillColor;
  final Color? hintColor;
  final Function? validation;
  final TextInputType? keyboardType;
  final String? errorText;
  final double? prefixIconSize;
  final double? errorTextHeight;
  final double? hintTextSize;
  final double? height;
  final double? weight;
  final double? radius;
  final FocusNode? focusNode;
  final Function(String)? onSaved;
  final bool? isView;
  final bool? isEnable;
  final bool? isEmail;
  final TextInputAction? textInputAction;

  CustomTextField(
      {Key? key,
      this.hint,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.onPress,
      this.errorText,
      this.prefixIconColor,
      this.suffixIconColor,
      this.fillColor,
      this.hintColor,
      this.onSaved,
      this.keyboardType,
      this.isView,
      this.isEmail,
      this.validation,
      this.prefixIconSize,
      this.onChanged,
      this.errorTextHeight,
      this.textColor,
      this.hintTextSize,
      this.height,
      this.weight,
      this.textInputAction = TextInputAction.next,
      this.radius,
      this.isEnable = true,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppCommonSize.s8),
        boxShadow: [
          AppColors.kOrdinaryShadow,
        ],
      ),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return TextFormField(
            focusNode: focusNode ?? null,
            enabled: isEnable,
            textAlign: TextAlign.start,
            obscureText: isView != null ? isView! : false,
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            textInputAction: textInputAction,
            style: kRegularLine16.copyWith(color: textColor),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: height ?? AppHeight.s20,
                    horizontal: weight ?? AppWeight.s25),
                isDense: true,
                suffixIcon: suffixIcon == null
                    ? null
                    : InkWell(
                        onTap: onPress,
                        child: Icon(
                          suffixIcon,
                          size: AppCommonSize.s20,
                          color: suffixIconColor,
                        ),
                      ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.0),
                  borderRadius:
                      BorderRadius.circular(radius ?? AppCommonSize.s30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius:
                      BorderRadius.circular(radius ?? AppCommonSize.s30),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius:
                      BorderRadius.circular(radius ?? AppCommonSize.s30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius:
                      BorderRadius.circular(radius ?? AppCommonSize.s30),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.0),
                  borderRadius:
                      BorderRadius.circular(radius ?? AppCommonSize.s30),
                ),
                filled: true,
                errorStyle: const TextStyle(height: 0),
                hintStyle: TextStyle(
                  fontSize: hintTextSize ?? AppTextSize.s16,
                  color: state.themeMode == ThemeModeStatus.dark?hintColor ?? Colors.grey:hintColor ?? Colors.white.withOpacity(0.4),
                  fontWeight: FontWeight.w400,
                ),
                hintText: hint,
                errorText: errorText,
                ),
            validator: validation as String? Function(String?)?,
            onSaved: onSaved as String? Function(String?)?,
          );
        },
      ),
    );
  }
}
