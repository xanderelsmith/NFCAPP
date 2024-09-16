import 'package:flutter/material.dart';
import 'package:nfcapp/commonwidget/expandedbuttons.dart';
import 'package:nfcapp/src/features/authentication/presentation/pages/passportphotoscreen.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/verifyemailscreen.dart';
import 'package:nfcapp/utils/screensizeutils.dart';

import '../../../../../style/textstyles.dart';
import '../../data/enum/verificationresponse.dart';
import 'verificationresponsescreen.dart';

class PassportVerification extends StatelessWidget {
  const PassportVerification({
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
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Identity verification',
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Get your Passport ready',
                      style: AppTextStyles.miniBold,
                    ),
                  ),
                  const Text(
                      'Make sure you capture a clear and complete image'),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Center(
                      child: Image.asset(
                        'images/card.png',
                        alignment: Alignment.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DarkExpandedButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PassportPhotoScreen()));
                },
                title: 'Continue',
              ),
            )
          ],
        ),
      ),
    );
  }
}
