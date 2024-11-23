import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/src/features/recievepayment/presentation/pages/reviewtransactionsceen.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/style/textstyles.dart';

class RecievedPaymentScreen extends StatelessWidget {
  const RecievedPaymentScreen({
    super.key,
    required this.value,
  });

  final String value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Back',
                    style: AppTextStyles.medium16.copyWith(
                      color: AppColors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RawChip(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                      side: const BorderSide(color: Colors.transparent)),
                  backgroundColor: const Color(0xffF6F6F6),
                  color: WidgetStateProperty.resolveWith(
                    (states) => const Color(0xffF6F6F6),
                  ),
                  label: Text(
                    'Received',
                    style: AppTextStyles.minute8.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 53.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Image.asset(
                        'images/currency/naira.png',
                        height: 36,
                      ),
                      Text(
                        '$value.00',
                        style: AppTextStyles.normal36.w700,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const ReviewListTile(
              title: 'Date & Time',
              amount: '10/04/2024, 17:45:43',
            ),
            const ReviewListTile(
              title: 'Transaction type',
              amount: 'Transfer',
            ),
            const ReviewListTile(
              title: 'Amount transfered',
              amount: '19,445.00',
              isCurrency: true,
            ),
            const ReviewListTile(
              title: 'Fee',
              amount: '35',
              isCurrency: true,
            ),
            const ReviewListTile(title: 'Payment Channel', amount: 'Gtbank'),
            const ReviewListTile(
                title: 'Account number', amount: '868969669857'),
            ReviewListTile(
              title: 'Reference Code',
              amount: 'GYGGYUUI8YHJJH',
              trailingIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  'images/copy.png',
                  height: 12,
                ),
              ),
            ),
            ReviewListTile(
              title: 'Status',
              amount: 'Completed',
              otherWidget: const Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Icon(
                  Icons.circle,
                  size: 5,
                  color: Color(0xff42CE71),
                ),
              ),
              amountStyle: AppTextStyles.normal12.w700.green,
            ),
            const Divider(),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                  ),
                  child: Text('Share Transaction Receipt',
                      style: AppTextStyles.tiny10.w600.copyWith(
                        color: AppColors.white,
                      ))),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffCFD6E0),
                    ),
                    child: Text('Repeat Transaction',
                        style: AppTextStyles.tiny10.w600.copyWith(
                          color: AppColors.white,
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
