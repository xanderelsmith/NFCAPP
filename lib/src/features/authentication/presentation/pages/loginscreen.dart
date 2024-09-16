import 'package:flutter/material.dart';
import 'package:nfcapp/src/features/authentication/presentation/pages/identityverification.dart';

import '../../../../../commonwidget/expandedbuttons.dart';
import '../../../../../commonwidget/specialtextfield.dart';
import '../../../../../style/textstyles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Back'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(children: [
              const Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Log In',
                      style: AppTextStyles.miniBold,
                    ),
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
                ],
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LightExpandedButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                IdentityVerificationScreen()));
                  },
                  title: 'Continue',
                ),
              )
            ])));
  }
}
