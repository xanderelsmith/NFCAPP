import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/src/features/homepage/presentation/pages/homepage.dart';
import 'package:nfcapp/src/features/homepage/presentation/pages/sublevels/accountpage.dart';
import 'package:nfcapp/src/features/homepage/presentation/pages/sublevels/homedashboard.dart';
import 'package:nfcapp/src/features/homepage/presentation/widgets/customnavigationbar.dart';
import 'package:nfcapp/src/features/recievepayment/presentation/widgets/customkeypad.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/style/textstyles.dart';

import '../../../../../utils/screensizeutils.dart';
import '../../../sendpayment/presentation/pages/sendmoneypreviewscreen.dart';
import '../widgets/carddetailsdashboard.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({
    super.key,
  });

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  String value = '0';
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
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text('Send money', style: AppTextStyles.medium20.w600)),
          const Expanded(child: SizedBox()),
          const Text(
            'Enter amount to send ',
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(bottom: 38.0),
            child: Text(
              '${formatNumberWithCommas(int.parse(value))} NGN',
              textAlign: TextAlign.center,
              style: AppTextStyles.high48.w600,
            ),
          ),
          CustomNumKeyPad(
            rightIcon: const Icon(Icons.backspace_outlined),
            size: const Size(78, 62.73),
            decoration: BoxDecoration(
                color: AppColors.numKeyboardColor,
                borderRadius: BorderRadius.circular(57)),
            leftButtonFn: () {},
            rightButtonFn: () {
              if (value.isNotEmpty && value.length > 1) {
                setState(() {
                  value =
                      value.replaceRange(value.length - 1, value.length, '');
                });
              } else {
                setState(() {
                  value = '0';
                });
              }
            },
            rightButtonLongPressFn: () {},
            onNumTap: (String number) {
              if (value.length < 10) {
                setState(() {
                  value += number;
                });
              }
            },
          )
        ]),
      ),
      bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(bottom: 40.0, left: 20, right: 20, top: 40),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    var amount = formatNumberWithCommas(int.parse(value));
                    return SendMoneyPreviewScreen(
                      value: value,
                    );
                  },
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
              ),
              child: Text('Submit',
                  style: AppTextStyles.tiny10.w600.copyWith(
                    color: AppColors.white,
                  )))),
    );
  }
}
