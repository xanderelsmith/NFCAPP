import 'package:flutter/material.dart';
import 'package:nfcapp/provider/themeprovider.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/countryselection_screen.dart';
import 'package:provider/provider.dart';

import '../style/color.dart';
import '../utils/screensizeutils.dart';

class DarkExpandedButton extends StatelessWidget {
  const DarkExpandedButton({
    super.key,
    required this.onTap,
    required this.title,
    this.style,
  });
  final VoidCallback onTap;
  final String title;
  final ButtonStyle? style;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: style ??
          ElevatedButton.styleFrom(
            backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
                ? AppColors.white
                : AppColors.brown,
            foregroundColor: Provider.of<ThemeProvider>(context).isDarkMode
                ? AppColors.black
                : AppColors.white,
            fixedSize: Size(getScreenSize(context).width - 50, 20),
          ),
      child: Text(title),
    );
  }
}

class LightExpandedButton extends StatelessWidget {
  const LightExpandedButton({
    super.key,
    required this.onTap,
    required this.title,
    this.style,
  });
  final VoidCallback onTap;
  final String title;
  final ButtonStyle? style;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: style ??
            ElevatedButton.styleFrom(
                fixedSize: Size(getScreenSize(context).width - 50, 20),
                backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
                    ? AppColors.white
                    : AppColors.black,
                foregroundColor: Provider.of<ThemeProvider>(context).isDarkMode
                    ? AppColors.black
                    : AppColors.white),
        onPressed: () {
          onTap();
        },
        child: Text(title));
  }
}
