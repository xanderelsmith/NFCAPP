import 'package:flutter/material.dart';
import 'package:nfcapp/commonwidget/expandedbuttons.dart';
import 'package:nfcapp/commonwidget/specialtextfield.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/provider/themeprovider.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/verifyemailscreen.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/utils/screensizeutils.dart';
import 'package:provider/provider.dart';

import '../../../../../style/textstyles.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final formKey = GlobalKey<FormState>();
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: 16.0,
                        ),
                        child: Text(
                          'Create Account',
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
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Login Password',
                        ),
                      ),
                      SpecialTextfield(
                        ishidden: isHidden,
                        isMultiline: false,
                        suffixwidget: IconButton(
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
                        validator: (value) {
                          final errorMessage =
                              PasswordValidator.validate(value!);
                          if (errorMessage != null) {
                            setState(() {
                              errors = errorMessage.entries.first.value;
                            });
                            return errorMessage.entries.first.key;
                          }

                          return null;
                        },
                      ),
                      if (errors != null)
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 8,
                            top: 16.0,
                            bottom: 15,
                          ),
                          child: const Text(
                            'Your password must contain:',
                            style: AppTextStyles.minute8,
                          ),
                        ),
                      if (errors != null)
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Text(
                            errors ?? '',
                            style: AppTextStyles.tiny10.red,
                          ),
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LightExpandedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(getScreenSize(context).width - 50, 20),
                      backgroundColor:
                          Provider.of<ThemeProvider>(context).isDarkMode
                              ? AppColors.white
                              : AppColors.black,
                      foregroundColor:
                          Provider.of<ThemeProvider>(context).isDarkMode
                              ? AppColors.black
                              : AppColors.white,
                    ),
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const VerifyEmailScreen()));
                      } else {}
                    },
                    title: 'Continue',
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class PasswordValidator {
  static Map<String, String>? validate(String password) {
    final List<String> errors = [];

    if (password.length < 6) {
      errors.add('X 8-32 characters long');
    }

    final RegExp lowercaseRegex = RegExp(r'[a-z]');
    final RegExp uppercaseRegex = RegExp(r'[A-Z]');
    final RegExp numberRegex = RegExp(r'[0-9]');
    final RegExp specialCharRegex = RegExp(r'[!@#\$]');

    if (!lowercaseRegex.hasMatch(password)) {
      errors.add('X 1 lowercase character');
    }

    if (!uppercaseRegex.hasMatch(password)) {
      errors.add('X 1 Uppercase character');
    }

    if (!numberRegex.hasMatch(password)) {
      errors.add('X 1 number');
    }

    if (!specialCharRegex.hasMatch(password)) {
      errors.add('X 1 special character e.g !@#\$');
    }

    if (errors.isNotEmpty) {
      return {'Password doesn’t meet requirement': errors.join('\n')};
      // return errors.join('\n');
    }

    return null;
  }
}
