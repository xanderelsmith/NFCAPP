import 'package:flutter/material.dart';
import 'package:nfcapp/src/features/authentication/presentation/pages/verificationresponsescreen.dart';

import '../../../../../commonwidget/expandedbuttons.dart';
import '../../../../../style/textstyles.dart';

class PassportPhotoScreen extends StatelessWidget {
  const PassportPhotoScreen({
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      alignment: Alignment.center,
                      color: const Color(0xffF4F2F2),
                      child: Image.asset('images/camera.png'),
                    ),
                  ])),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LightExpandedButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const VerificationResponseScreen(),
                          ));
                    },
                    title: 'Take Photo',
                  ))
            ])));
  }
}
