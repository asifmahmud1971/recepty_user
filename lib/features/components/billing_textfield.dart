import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillingTextField extends StatelessWidget {
  final String? labelName;
  final String? hint;
  final bool? isDropdown;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onPress;
  final Color? sufixIconColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? isView;

  const BillingTextField(
      {Key? key,
        this.labelName,
        this.hint,
        this.isDropdown = false,
        this.controller, this.keyboardType, this.suffixIcon, this.prefixIcon, this.onPress, this.sufixIconColor, this.isView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "Food",
      "Transport",
      "Personal",
      "Shopping",
      "Medical",
      "Rent",
      "Movie",
      "Salary"
    ];

    return !isDropdown!
        ? SizedBox(
      width: 1.sw,
      child: TextField(
        obscureText: isView != null ? isView! : false,
        controller: controller,
        autofocus: false,
        onChanged: (val) {},
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          labelText: labelName ?? 'label',
          hintText: hint ?? "hint",

          suffixIcon: suffixIcon == null
              ? null
              : InkWell(
              onTap: onPress,
              child: Icon(
                suffixIcon,
                size: 20.r,
                color: sufixIconColor,
              )),
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
      ),
    )
        : SizedBox(
      width: 1.sw,
      child: DropdownButtonFormField(
        autofocus: false,
        onChanged: (val) {},
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          labelText: labelName ?? 'label',
          hintText: hint ?? "hint",
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
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
