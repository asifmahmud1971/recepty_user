import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/custom_text_field.dart';

class StepCard extends StatefulWidget {
  final TextEditingController? descController;
  final TextEditingController? titleController;
  final VoidCallback? onAdd;
  final Function(int)? getStep;

  const StepCard(
      {Key? key,
      this.descController,
      this.titleController,
      this.onAdd,
      this.getStep})
      : super(key: key);

  @override
  State<StepCard> createState() => _StepCardState();
}

class _StepCardState extends State<StepCard> {
  int _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.addStep.tr(),
              style: kRegularLine13.copyWith(
                  fontWeight: FontWeight.w500, color: Colors.black),
            ),
            kHeightBox5,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: NumberPicker(
                itemHeight: 35.h,
                itemWidth: 35.h,
                selectedTextStyle:
                    kRegularLine16.copyWith(color: AppColors.kPrimaryColor),
                textStyle:
                    kRegularLine16.copyWith(color: AppColors.kPrimaryColor),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.kFbColors)),
                axis: Axis.horizontal,
                value: _currentValue,
                minValue: 1,
                maxValue: 100,
                onChanged: (value) => setState(() =>
                    {_currentValue = value, widget.getStep!(_currentValue)}),
              ),
            ),
            kHeightBox10,
          /*  CustomTextField(
              controller: widget.descController,
              titleStyle: kRegularLine13.copyWith(
                  fontWeight: FontWeight.w500, color: Colors.black),
              title: AppStrings.description.tr(),
              maxLine: 5,
              hint: AppStrings.description.tr(),
              hintTextSize: 13.sp,
              hintColor: Color(0XFFA2ACBA),
            ),
            kHeightBox10,
            Align(
                alignment: Alignment.centerRight,
                child: DefaultBtn(
                  title: AppStrings.addStep.tr(),
                  radius: 10,
                  onPress: widget.onAdd,
                ))*/
          ],
        ),
      ),
    );
  }
}
