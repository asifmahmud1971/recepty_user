import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_form_field/phone_form_field.dart';

class CountryPickerTextField extends StatefulWidget {
  final String? hint;
  final String? title;
  final PhoneController? textEditingController;
  final IconData? suffixIcon;
  final Widget? numberPicker;
  final VoidCallback? onPress;
  final Color? prefixIconColor;
  final Color? sufixIconColor;
  final Color? fillColor;
  final Color? hintColor;
  final String? labelName;
  String? control;
  final TextInputType? keyboardType;

  CountryPickerTextField(
      {Key? key,
      this.hint,
      this.textEditingController,
      this.suffixIcon,
      this.numberPicker,
      this.onPress,
      this.prefixIconColor,
      this.sufixIconColor,
      this.fillColor,
      this.hintColor,
      this.control,
      this.keyboardType,
      this.title,
      this.labelName})
      : super(key: key);

  @override
  State<CountryPickerTextField> createState() => _CountryPickerTextFieldState();
}

class _CountryPickerTextFieldState extends State<CountryPickerTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: PhoneFormField(
        autofocus: false,
        onChanged: (val) {},
        controller: widget.textEditingController,
        decoration: InputDecoration(
          isDense: true,
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),

          prefix: widget.numberPicker,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
          labelText: widget.labelName ?? 'label',
          hintText: widget.hint ?? "hint",
          floatingLabelAlignment: FloatingLabelAlignment.start,
          // add here
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 107, 106, 144),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 107, 106, 144), width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
        ),

        /*decoration: InputDecoration(
          prefixIcon: widget.numberPicker,
          contentPadding: const EdgeInsets.all(10.0),
          labelText: widget.labelName ?? 'label',
          hintText: widget.hint ?? "hint",
          // add here
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 107, 106, 144),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 107, 106, 144), width: 2),
            borderRadius: BorderRadius.circular(5),
          ),

        ),*/
      ),
    );
  }
}
