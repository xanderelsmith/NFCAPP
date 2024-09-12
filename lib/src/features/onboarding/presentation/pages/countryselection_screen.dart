import 'package:flutter/material.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/createaccountsceen.dart';
import 'package:nfcapp/style/textstyles.dart';

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
                    style: AppTextStyles.miniBold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Country/Region of residence',
                    style: AppTextStyles.small,
                  ),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 4,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
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
              padding: const EdgeInsets.only(bottom: 8.0),
              child: LightExpandedButton(
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
