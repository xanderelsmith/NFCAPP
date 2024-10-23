import 'package:flutter/material.dart';

extension TextStyling on TextStyle {
  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.bold);
  }

  TextStyle get w500 {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get black {
    return copyWith(color: Colors.black);
  }

  TextStyle get miniBold => copyWith(fontWeight: FontWeight.w500);
}
