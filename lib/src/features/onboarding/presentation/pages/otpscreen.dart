import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/provider/themeprovider.dart';
import 'package:nfcapp/src/features/recievepayment/presentation/widgets/customkeypad.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/utils/screensizeutils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../../commonwidget/expandedbuttons.dart';
import '../../../../../commonwidget/specialtextfield.dart';
import '../../../../../style/textstyles.dart';
import '../../../authentication/presentation/pages/loginscreen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    const Expanded(child: SizedBox()),
                    const Align(
                      alignment: Alignment(0, 0.7),
                      child: Text(
                        'Enter your Pin',
                        style: AppTextStyles.mini,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    PinCodeTextField(
                      appContext: context,
                      textStyle: AppTextStyles.small14.w400.copyWith(
                        color: AppColors.black,
                      ),
                      length: 4,
                      animationType: AnimationType.fade,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      validator: (v) {
                        if (v!.split('').length < 5) {
                          return '';
                        } else {
                          return '';
                        }
                      },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 61,
                          fieldWidth: 61,
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
                    Expanded(
                        flex: 3,
                        child: CustomNumKeyPad(
                          textColor:
                              Provider.of<ThemeProvider>(context).isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                          rightIcon: const Icon(Icons.backspace_outlined),
                          leftButtonFn: () {},
                          rightButtonFn: () {
                            if (textEditingController.text.isNotEmpty &&
                                textEditingController.text.length > 1) {
                              setState(() {
                                textEditingController.text =
                                    textEditingController.text.replaceRange(
                                        textEditingController.text.length - 1,
                                        textEditingController.text.length,
                                        '');
                              });
                            } else {
                              setState(() {
                                textEditingController.text = '0';
                              });
                            }
                          },
                          rightButtonLongPressFn: () {},
                          onNumTap: (String number) {
                            log(number);
                            if (textEditingController.text.length < 4) {
                              setState(() {
                                textEditingController.text += number;
                              });
                            }
                          },
                        ))
                  ])),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  title: 'Verify Account',
                ),
              )
            ])));
  }
}
