import 'package:flutter/material.dart';
import 'package:nfcapp/style/color.dart';

class AppThemes {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    cardTheme: const CardTheme(color: AppColors.cardColorDark),
    appBarTheme: const AppBarTheme(
      titleSpacing: 0,
      backgroundColor: AppColors.black,
      titleTextStyle: TextStyle(
        color: AppColors.blue,
        fontSize: 12,
      ),
      iconTheme: IconThemeData(color: AppColors.blue),
    ),
    scaffoldBackgroundColor: AppColors.black,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black, foregroundColor: AppColors.white),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff626262)),
  );
  static ThemeData lightTheme = ThemeData.light().copyWith(
    cardTheme: const CardTheme(color: AppColors.cardColorDark),
    scaffoldBackgroundColor: const Color(0xffffffff),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.grey, foregroundColor: AppColors.black),
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
        color: AppColors.blue,
        fontSize: 12,
      ),
      iconTheme: IconThemeData(color: AppColors.blue),
    ),
  );
}
