// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  InputTextField({
    super.key,
    required this.width,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.validator,
    this.textInputType,
    this.suffixIcon,
    this.obscureText,
  });
  // ignore: prefer_typing_uninitialized_variables
  var validator;
  final double width;
  final String hintText;
  final String labelText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? textInputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * width,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
        ),
        validator: validator,
        obscureText: obscureText ?? false,
        keyboardType: textInputType,
      ),
    );
  }
}
