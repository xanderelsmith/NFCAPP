import 'package:flutter/material.dart';
import 'package:nfcapp/style/color.dart';

import '../utils/screensizeutils.dart';

class AppThemes {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.black, foregroundColor: AppColor.white),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff626262)),
  );
  static ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color(0xffffffff),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.grey, foregroundColor: AppColor.black),
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff626262), primary: const Color(0xff0D60D8)),
      dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
              backgroundColor:
                  WidgetStateProperty.resolveWith((states) => Colors.red),
              side: WidgetStateProperty.resolveWith(
                (states) => const BorderSide(width: 3, color: Colors.red),
              ),
              shape: WidgetStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                    side: const BorderSide(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.circular(20)),
              ))),
      appBarTheme: const AppBarTheme(
        titleSpacing: 0,
        backgroundColor: Color(0xffffffff),
        titleTextStyle: TextStyle(
          color: AppColor.blue,
          fontSize: 12,
        ),
        iconTheme: IconThemeData(color: AppColor.blue),
      ));
}
