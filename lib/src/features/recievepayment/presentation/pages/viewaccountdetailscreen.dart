import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/src/features/recievepayment/presentation/pages/transfer_money_screen.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/style/textstyles.dart';

class ViewAccounDetailsScreen extends StatelessWidget {
  const ViewAccounDetailsScreen({super.key});

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
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              margin: const EdgeInsets.only(
                top: 18,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color(0xff8D8D8D).withOpacity(0.5529))),
              height: 425,
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      children: [
                        const CustomDetailsRow(
                          name: 'Philemon Afolabi',
                          title: 'Account Holder',
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: CustomDetailsRow(
                            title: 'Account number',
                            name: '9017978394',
                          ),
                        ),
                        const CustomDetailsRow(
                          title: 'Bank Name:',
                          name: 'Wema Bank PLC',
                        ),
                        Center(
                          child: TextButton.icon(
                            iconAlignment: IconAlignment.end,
                            label: Text(
                              'Share Details',
                              style: AppTextStyles.tinygrey12.w400.copyWith(
                                color: AppColors.iconblue,
                              ),
                            ),
                            onPressed: () {},
                            icon: Image.asset(
                              'images/upload.png',
                              height: 13.81,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.dividerColor),
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    width: double.maxFinite,
                    child: Text.rich(
                      TextSpan(
                          text: 'PLEASE NOTE:\n\n',
                          style: AppTextStyles.normal12.w400,
                          children: [
                            const TextSpan(
                                text:
                                    'This account can only receive funds in\t'),
                            TextSpan(
                              text: 'Nigerian Naira (NGN).\n\n',
                              style: AppTextStyles.normal12.w700,
                            ),
                            const TextSpan(
                                text:
                                    'Payments will take a few minutes to reflect.\n\nThere are no additional fees on deposits')
                          ]),
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
                      builder: (context) => const TransferMoneyScreen(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
              ),
              child: Text('Transfer',
                  style: AppTextStyles.tiny10.w600.copyWith(
                    color: AppColors.white,
                  )))),
    );
  }
}

class CustomDetailsRow extends StatelessWidget {
  const CustomDetailsRow({
    super.key,
    required this.name,
    required this.title,
  });
  final String name;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTextStyles.tiny10.w400.copyWith(
                  color: AppColors.brown,
                ),
              ),
              Text(
                name,
                style: AppTextStyles.tinygrey12.w400.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          Image.asset(
            'images/copy.png',
            height: 12,
          )
        ],
      ),
    );
  }
}
