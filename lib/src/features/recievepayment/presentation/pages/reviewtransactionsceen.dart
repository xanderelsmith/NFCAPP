import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/src/features/recievepayment/presentation/pages/receivedpaymentscreen.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/style/textstyles.dart';

class ReviewTransactionScreen extends StatelessWidget {
  const ReviewTransactionScreen({
    required this.value,
    super.key,
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
        title: Text(
          'Review Transaction',
          style: AppTextStyles.medium16.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(
                  top: 51,
                  bottom: 24,
                ),
                // padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.brown,
                      width: 1,
                    )),
                height: 88,
                width: double.maxFinite,
                child: Column(
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
                        'NGN Balance Deposit',
                        style: AppTextStyles.minute8.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Image.asset(
                          'images/currency/naira.png',
                          height: 15,
                        ),
                        Text(
                          '$value.00',
                          style: AppTextStyles.medium20.w700,
                        ),
                      ],
                    ),
                  ],
                )),
            const ReviewListTile(
              title: 'Amount to pay',
              amount: '20,000.00',
              isCurrency: true,
            ),
            const ReviewListTile(
              title: 'Transaction fee',
              amount: '160.00',
              isCurrency: true,
            ),
            const ReviewListTile(
              title: 'Amount you will receive',
              amount: '19,445.00',
              isCurrency: true,
            ),
            const ReviewListTile(title: 'Payment method', amount: 'Transfer'),
            const ReviewListTile(title: 'Bank name', amount: 'Gtbank'),
            const ReviewListTile(
                title: 'Account number', amount: '868969669857'),
            const ReviewListTile(
                title: 'Account name', amount: 'Philemon Timi'),
            const Divider(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(bottom: 40.0, left: 20, right: 20, top: 40),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecievedPaymentScreen(
                        value: value,
                      ),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
              ),
              child: Text('Confirm payment',
                  style: AppTextStyles.tiny10.w600.copyWith(
                    color: AppColors.white,
                  )))),
    );
  }
}

class ReviewListTile extends StatelessWidget {
  const ReviewListTile({
    super.key,
    required this.title,
    this.color,
    required this.amount,
    this.isCurrency = false,
    this.otherWidget,
    this.amountStyle,
    this.trailingIcon,
  });
  final String title;
  final Widget? trailingIcon;
  final Widget? otherWidget;
  final String amount;
  final Color? color;
  final bool isCurrency;
  final TextStyle? amountStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Row(
              children: [
                if (isCurrency)
                  Image.asset(
                    'images/currency/naira.png',
                    height: 9,
                  ),
                if (otherWidget != null) otherWidget!,
                Text(
                  amount,
                  style: amountStyle ?? AppTextStyles.normal12.w700,
                ),
                if (trailingIcon != null) trailingIcon!,
              ],
            ),
          ],
        ),
      ],
    );
  }
}
