import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/src/features/homepage/presentation/widgets/carddetailsdashboard.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/style/textstyles.dart';
import 'package:nfcapp/utils/screensizeutils.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/themeprovider.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: 8.0,
              ),
              child: CircleAvatar(
                radius: 15,
              ),
            ),
            Card(
              elevation: 0,
              child: SizedBox(
                width: getScreenSize(context).width - 50,
                height: 82,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Gain additional account privileges',
                                textAlign: TextAlign.start,
                                style: AppTextStyles.small14.bold,
                              ),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                size: 16,
                              )
                            ],
                          ),
                          const Text(
                            'Complete your KYC verification to access more features. ',
                            textAlign: TextAlign.start,
                            style: AppTextStyles.tiny10,
                          ),
                        ],
                      )),
                ),
              ),
            ),
            const CardDetailsDashboard(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'RECENT TRANSACTIONS',
                    style: AppTextStyles.tiny10.bold,
                  ),
                  Text(
                    'See all',
                    style: AppTextStyles.tiny10.bold.copyWith(
                      color: AppColors.blue,
                    ),
                  )
                ],
              ),
            ),
            Card(
                child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10,
                right: 10,
              ),
              child: Column(
                  children: List.generate(
                5,
                (index) => ListTile(
                  trailing: SizedBox(
                    height: 35,
                    child: Text(
                      '#30,000',
                      maxLines: 1,
                      style: AppTextStyles.tinygrey12.bold.copyWith(
                        color: Provider.of<ThemeProvider>(context).isDarkMode
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                  ),
                  minLeadingWidth: 0,
                  contentPadding: EdgeInsets.zero,
                  subtitle: Row(
                    children: [
                      Text(
                        'Bank account ',
                        style: AppTextStyles.tiny10.copyWith(
                          color: Provider.of<ThemeProvider>(context).isDarkMode
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Icon(
                          Icons.circle,
                          color: Provider.of<ThemeProvider>(context).isDarkMode
                              ? AppColors.white
                              : const Color(0xffAAAAAA),
                          size: 5,
                        ),
                      ),
                      Text(
                        '02 April 2024',
                        style: AppTextStyles.tiny10.copyWith(
                          color: Provider.of<ThemeProvider>(context).isDarkMode
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    'Ayotunde Abdulsalam',
                    style: AppTextStyles.small14.copyWith(
                      color: Provider.of<ThemeProvider>(context).isDarkMode
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: AppColors.outboxPaymentCircleColor,
                    radius: 19,
                    child: Center(
                        child: Image.asset(
                      'images/out.png',
                      color: AppColors.green,
                    )),
                  ),
                ),
              )),
            ))
          ],
        ),
      ),
    );
  }
}
