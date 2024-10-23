import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';

import '../../../../../commonwidget/expandedbuttons.dart';
import '../../../../../commonwidget/specialtextfield.dart';
import '../../../../../style/textstyles.dart';
import '../../../authentication/presentation/pages/loginscreen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment(0, 0.7),
                        child: Text(
                          'Enter your Pin',
                          style: AppTextStyles.mini.miniBold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          4,
                          (index) => Container(
                                margin: const EdgeInsets.all(10),
                                height: 45,
                                width: 45,
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
                    Expanded(
                      flex: 3,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            4,
                            (index) => Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                  3,
                                  (newindex) {
                                    int i = ((index * 3) + newindex) + 1;
                                    return Expanded(
                                      child: Text(
                                        '${i == 10 ? ' ' : i == 11 ? 0 : i}',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.mediumbold,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )),
                    )
                  ])),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LightExpandedButton(
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
