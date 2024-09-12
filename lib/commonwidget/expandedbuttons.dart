import 'package:flutter/material.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/countryselection_screen.dart';

import '../style/color.dart';
import '../utils/screensizeutils.dart';

class DarkExpandedButton extends StatelessWidget {
  const DarkExpandedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CountrySelectionSceen()));
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.black,
          fixedSize: Size(getScreenSize(context).width - 50, 20),
          foregroundColor: AppColor.white),
      child: const Text('Create Account'),
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
            backgroundColor: AppColor.grey,
            foregroundColor: AppColor.black),
        onPressed: () {
          onTap();
        },
        child: Text(title));
  }
}
