import 'package:conversor_moedas/layout/colors.dart';
import 'package:flutter/material.dart';

class MyTypography {
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  MyTypography({
    this.fontWeight = FontWeight.w400,
    this.fontSize,
    this.color = MyColors.BLACK,
  });

  MyTypography.regular({
    this.fontWeight = FontWeight.w400,
    this.fontSize,
    this.color = MyColors.BLACK,
  });

  MyTypography.medium({
    this.fontWeight = FontWeight.w500,
    this.fontSize,
    this.color = MyColors.BLACK,
  });

  MyTypography.bold({
    this.fontWeight = FontWeight.w700,
    this.fontSize,
    this.color = MyColors.BLACK,
  });

  // @override
  // Widget build(BuildContext context) {
  //   return TextStyle(
  //     fontFamily: 'Poppins',
  //     color: color,
  //     fontSize: fontSize,
  //     fontWeight: fontWeight,
  //   );
  // }
}
