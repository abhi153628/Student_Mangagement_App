// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormField extends StatelessWidget {
  String? hintText;
  double? borderRadius;
  String? labeltext;
  IconData? icon;
  final String? Function(String?)? validator;

  TextEditingController? controller;
  CustomFormField(
      {super.key,
      this.hintText,
      this.borderRadius,
      this.labeltext,
      this.icon,
      required this.controller,
      required this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.5,
            color: Color.fromARGB(255, 255, 255, 255)),
        hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color.fromARGB(255, 255, 255, 255)),
        hintText: hintText,
      ),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
