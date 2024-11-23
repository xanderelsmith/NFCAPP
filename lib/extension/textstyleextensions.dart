import 'package:flutter/material.dart';
import 'package:nfcapp/style/color.dart';

extension AppTextStyleExtensions on TextStyle {
  TextStyle get bold => copyWith(
        fontWeight: FontWeight.bold,
      );
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get white => copyWith(color: Colors.white);

  TextStyle get green => copyWith(color: AppColors.green);
  TextStyle get red => copyWith(color: AppColors.red);
  TextStyle get thickgrey => copyWith(color: const Color(0xff5B5B5B));
}
