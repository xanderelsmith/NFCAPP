import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/otpscreen.dart';

import '../../../../../commonwidget/expandedbuttons.dart';
import '../../../../../commonwidget/specialtextfield.dart';
import '../../../../../style/textstyles.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
          title: const Text('Back'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      'Verify your Email',
                      style: AppTextStyles.mini.miniBold,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Please enter the OTP sent\n to Sirphil8@gmail.com ',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          6,
                          (index) => Container(
                                margin: const EdgeInsets.all(10),
                                height: 40,
                                width: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextField(
                                  maxLength: 1,
                                  textAlign: TextAlign.center,
                                  buildCounter: (context,
                                          {required currentLength,
                                          required isFocused,
                                          required maxLength}) =>
                                      const SizedBox(),
                                  enableSuggestions: false,
                                ),
                              )),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Resend after 30 seconds',
                      ),
                    ),
                  ])),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LightExpandedButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpScreen()));
                  },
                  title: 'Verify Account',
                ),
              )
            ])));
  }
}
