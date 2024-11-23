import 'package:flutter/material.dart';

import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/src/features/recievepayment/presentation/pages/confirm_details_screen.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/style/textstyles.dart';

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({
    super.key,
  });

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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bank Transfer',
              style: AppTextStyles.medium20.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                  'Top up your NGN account by transferring to your NGN Bank account',
                  style: AppTextStyles.minute8.w400.copyWith(
                    color: AppColors.textGrey,
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(
                top: 18,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.circleAvatarColor)),
              height: 104 + 18,
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Image.asset(
                          'images/country/nigeria.png',
                          height: 12,
                          width: 12,
                        ),
                      ),
                      Text(
                        'Nigerian Naira',
                        style: AppTextStyles.tiny10.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 9.0),
                    child: Text(
                      'Get your Naira bank account to receive payments in NGN',
                      style: AppTextStyles.minute8
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffEAEAEA),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                        fixedSize: const Size(132, 32)),
                    child: Text(
                      'Get your NGA Bank Account',
                      style: AppTextStyles.minute8.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            bottom: 40.0,
            left: 20,
            right: 20,
          ),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmDetailsScreen(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
              ),
              child: Text('Use alternate top-up method',
                  style: AppTextStyles.tiny10.w600.copyWith(
                    color: AppColors.white,
                  )))),
    );
  }
}
