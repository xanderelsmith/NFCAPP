import 'package:flutter/material.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/countryselection_screen.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/style/textstyles.dart';
import 'package:nfcapp/utils/screensizeutils.dart';
import 'package:provider/provider.dart';

import '../../../../../commonwidget/expandedbuttons.dart';
import '../../../../../provider/themeprovider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: getScreenSize(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('images/checkeredbox.png'),
            const Text(
              'Get paid\n more Quickly',
              style: AppTextStyles.mediumbold,
              textAlign: TextAlign.center,
            ),
            const Text(
              'Open a global account to send and receive\n payments within seconds.',
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                DarkExpandedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        Provider.of<ThemeProvider>(context).isDarkMode
                            ? AppColors.black
                            : AppColors.white,
                    fixedSize: Size(getScreenSize(context).width - 50, 20),
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).isDarkMode
                            ? AppColors.white
                            : AppColors.black,
                  ),
                  title: 'Create account',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CountrySelectionSceen()));
                  },
                ),
                LightExpandedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        Provider.of<ThemeProvider>(context).isDarkMode
                            ? AppColors.white
                            : AppColors.black,
                    fixedSize: Size(getScreenSize(context).width - 50, 20),
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).isDarkMode
                            ? AppColors.brown
                            : AppColors.grey,
                  ),
                  onTap: () {},
                  title: 'Log in',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
