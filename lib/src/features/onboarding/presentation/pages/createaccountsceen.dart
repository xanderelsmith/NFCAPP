import 'package:flutter/material.dart';
import 'package:nfcapp/commonwidget/expandedbuttons.dart';
import 'package:nfcapp/commonwidget/specialtextfield.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/src/features/authentication/presentation/pages/passportverificationscree.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/verifyemailscreen.dart';

import '../../../../../style/textstyles.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

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
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Account',
                      style: AppTextStyles.mini.miniBold,
                    ),
                    const Text(
                      'Email Address',
                    ),
                    const SpecialTextfield(
                      innerHint: 'Enter Email Address',
                    ),
                    const Text(
                      'Login Password',
                    ),
                    const SpecialTextfield(),
                    const Text(
                      'Password doesn\'t meet requirements',
                    ),
                    const Text('8-32 characters long'),
                    const Text('1 lowercase character'),
                    const Text('1 Uppercase character'),
                    const Text('1 number'),
                    const Text('1 special character e.g !@#\$'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LightExpandedButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerifyEmailScreen()));
                  },
                  title: 'Continue',
                ),
              )
            ],
          ),
        ));
  }
}
