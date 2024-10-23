import 'package:flutter/material.dart';
import 'package:nfcapp/commonwidget/expandedbuttons.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';

import '../../../../../style/textstyles.dart';
import '../../../../../utils/screensizeutils.dart';
import '../../../homepage/presentation/pages/homepage.dart';
import '../../data/enum/verificationresponse.dart';

class VerificationResponseScreen extends StatelessWidget {
  const VerificationResponseScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    VerificationResponse verificationResponse = VerificationResponse.successful;
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
      body: SizedBox(
        width: getScreenSize(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  'Identity verification',
                  style: AppTextStyles.medium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      verificationResponse.imageSrc,
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 10,
                    ),
                    child: Text(
                      verificationResponse.title,
                      style: AppTextStyles.mini.miniBold,
                    ),
                  ),
                  Text(
                    verificationResponse.message,
                    style: AppTextStyles.tinygrey,
                    textAlign: TextAlign.center,
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
                              builder: (context) => const Homepage()));
                    },
                    title: verificationResponse.buttonTitle,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
