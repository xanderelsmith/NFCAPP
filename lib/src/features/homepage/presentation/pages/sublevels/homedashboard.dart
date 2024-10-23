import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/src/features/homepage/presentation/widgets/carddetailsdashboard.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/style/textstyles.dart';
import 'package:nfcapp/utils/screensizeutils.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            color: const Color(0xffF6F6F6),
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
                          style: AppTextStyles.tiny,
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
                  style: AppTextStyles.tiny.bold,
                ),
                Text(
                  'See all',
                  style: AppTextStyles.tiny.bold.copyWith(
                    color: AppColor.blue,
                  ),
                )
              ],
            ),
          ),
          ...List.generate(
            5,
            (index) => ListTile(
              trailing: SizedBox(
                width: 50,
                height: 35,
                child: Text('#30,000',
                    style: AppTextStyles.tinygrey.bold
                        .copyWith(color: AppColor.black)),
              ),
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              subtitle: const Row(
                children: [
                  Text('Bank account ', style: AppTextStyles.tiny),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(
                      Icons.circle,
                      color: Color(0xffAAAAAA),
                      size: 5,
                    ),
                  ),
                  Text('02 April 2024', style: AppTextStyles.tiny),
                ],
              ),
              title: const Text(
                'Ayotunde Abdulsalam',
                style: AppTextStyles.small14,
              ),
              leading: CircleAvatar(
                backgroundColor: AppColor.outboxPaymentCircleColor,
                radius: 19,
                child: Center(
                    child: Image.asset(
                  'images/out.png',
                  color: AppColor.green,
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
