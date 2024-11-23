import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/provider/themeprovider.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/otpscreen.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/utils/screensizeutils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../../commonwidget/expandedbuttons.dart';
import '../../../../../style/textstyles.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({
    super.key,
  });

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";
  String currentText = "";
  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
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
                    const Text(
                      'Verify your Email',
                      style: AppTextStyles.mini,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Please enter the OTP sent\n to Sirphil8@gmail.com ',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: PinCodeTextField(
                        appContext: context,
                        textStyle: AppTextStyles.small14.w400.copyWith(
                          color: AppColors.black,
                        ),
                        length: 6,
                        animationType: AnimationType.fade,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        validator: (v) {
                          if (v!.split('').length < 6) {
                            return '';
                          } else {
                            return '';
                          }
                        },
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 50,
                            fieldWidth: 50,
                            activeFillColor: Colors.white,
                            selectedFillColor: Colors.white,
                            activeColor: Colors.blue,
                            inactiveFillColor: AppColors.white,
                            disabledColor: Colors.amber,
                            inactiveColor: AppColors.black),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(
                          milliseconds: 300,
                        ),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text.rich(TextSpan(
                          text: 'Resend\t',
                          style: AppTextStyles.tiny10.w400.copyWith(
                            color: AppColors.blue,
                          ),
                          children: [
                            TextSpan(
                              text: 'after 30 seconds',
                              style: AppTextStyles.tiny10.w400.copyWith(
                                color: Provider.of<ThemeProvider>(context)
                                        .isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            )
                          ])),
                    ),
                  ])),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  bottom: 40,
                ),
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
