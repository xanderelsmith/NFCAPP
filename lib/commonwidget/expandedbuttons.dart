import 'package:flutter/material.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/countryselection_screen.dart';

import '../style/color.dart';
import '../utils/screensizeutils.dart';

class DarkExpandedButton extends StatelessWidget {
  const DarkExpandedButton({
    super.key,
    required this.onTap,
    required this.title,
  });
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeMode.system == ThemeMode.dark
            ? AppColor.white
            : AppColor.brown,
        foregroundColor: ThemeMode.system == ThemeMode.dark
            ? AppColor.black
            : AppColor.white,
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
  });
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(getScreenSize(context).width - 50, 20),
            backgroundColor: ThemeMode.system != ThemeMode.light
                ? AppColor.black
                : AppColor.grey,
            foregroundColor: ThemeMode.system != ThemeMode.light
                ? AppColor.grey
                : AppColor.brown),
        onPressed: () {
          onTap();
        },
        child: Text(title));
  }
}
