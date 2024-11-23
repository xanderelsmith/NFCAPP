import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/provider/themeprovider.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/createaccountsceen.dart';
import 'package:nfcapp/style/textstyles.dart';
import 'package:provider/provider.dart';

import '../../../../../commonwidget/expandedbuttons.dart';
import '../../../../../style/color.dart';
import '../../../../../utils/screensizeutils.dart';

class CountrySelectionSceen extends StatefulWidget {
  const CountrySelectionSceen({
    super.key,
  });

  @override
  State<CountrySelectionSceen> createState() => _CountrySelectionSceenState();
}

class _CountrySelectionSceenState extends State<CountrySelectionSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
        ),
        title: const Text('Back'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What country do you live in?',
                    style: AppTextStyles.mini,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Country/Region of residence',
                    style: AppTextStyles.small15,
                  ),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 4,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Provider.of<ThemeProvider>(context).isDarkMode
                              ? AppColors.white
                              : AppColors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                      isExpanded: true,
                      value: country.first,
                      underline: const SizedBox(),
                      items: country
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 28.0),
              child: LightExpandedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(getScreenSize(context).width - 50, 20),
                  foregroundColor:
                      Provider.of<ThemeProvider>(context).isDarkMode
                          ? AppColors.black
                          : AppColors.white,
                  backgroundColor:
                      Provider.of<ThemeProvider>(context).isDarkMode
                          ? AppColors.white
                          : AppColors.black,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateAccountScreen()));
                },
                title: 'Continue',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> country = ['Nigeria', 'Usa', 'India'];
