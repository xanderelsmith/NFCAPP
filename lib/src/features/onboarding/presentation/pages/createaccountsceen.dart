import 'package:flutter/material.dart';
import 'package:nfcapp/commonwidget/expandedbuttons.dart';
import 'package:nfcapp/commonwidget/specialtextfield.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/verifyemailscreen.dart';

import '../../../../../style/textstyles.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Back'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Account',
                      style: AppTextStyles.miniBold,
                    ),
                    Text(
                      'Email Address',
                    ),
                    SpecialTextfield(
                      innerHint: 'Enter Email Address',
                    ),
                    Text(
                      'Login Password',
                    ),
                    SpecialTextfield(),
                    Text(
                      'Password doesn\'t meet requirements',
                    ),
                    Text('8-32 characters long'),
                    Text('1 lowercase character'),
                    Text('1 Uppercase character'),
                    Text('1 number'),
                    Text('1 special character e.g !@#\$'),
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
