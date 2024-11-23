import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/provider/themeprovider.dart';
import 'package:nfcapp/src/features/authentication/presentation/pages/identityverification.dart';
import 'package:provider/provider.dart';

import '../../../../../commonwidget/expandedbuttons.dart';
import '../../../../../commonwidget/specialtextfield.dart';
import '../../../../../style/color.dart';
import '../../../../../style/textstyles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHidden = true;
  String? errors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 15,
            ),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Log In',
                      style: AppTextStyles.mini,
                    ),
                  ),
                  const Text(
                    'Email Address',
                  ),
                  const SpecialTextfield(
                    innerHint: 'Enter Email Address',
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 16.0,
                      bottom: 4,
                    ),
                    child: Text(
                      'Login Password',
                    ),
                  ),
                  SpecialTextfield(
                    ishidden: isHidden,
                    isMultiline: false,
                    suffixwidget: IconButton(
                        color: Provider.of<ThemeProvider>(context).isDarkMode
                            ? AppColors.white
                            : AppColors.black,
                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        icon: isHidden
                            ? const Icon(
                                Icons.visibility_outlined,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                              )),
                  ),
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
                                const IdentityVerificationScreen()));
                  },
                  title: 'Continue',
                ),
              )
            ])));
  }
}
