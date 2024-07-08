import 'package:flutter/material.dart';



// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
 final Color color;
  final TextStyle style;
   CustomText({super.key, required this.text,required this.color,required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color,fontSize: 25),);
  }
}