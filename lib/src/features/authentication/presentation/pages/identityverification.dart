import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';

import '../../../../../commonwidget/expandedbuttons.dart';
import '../../../../../commonwidget/specialtextfield.dart';
import '../../../../../style/textstyles.dart';
import '../../data/enum/verificationdoc.dart';
import 'passportverificationscree.dart';

class IdentityVerificationScreen extends StatefulWidget {
  const IdentityVerificationScreen({
    super.key,
  });

  @override
  State<IdentityVerificationScreen> createState() =>
      _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState
    extends State<IdentityVerificationScreen> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Identity verification',
                      style: AppTextStyles.mini.miniBold,
                    ),
                  ),
                  Text(
                    'First Name',
                  ),
                  SpecialTextfield(
                    innerHint: 'Enter First Name ',
                  ),
                  Text(
                    'Last Name',
                  ),
                  SpecialTextfield(
                    innerHint: 'Enter First Name ',
                  ),
                  Text(
                    'Enter Phone Number',
                  ),
                  SpecialTextfield(
                    innerHint: '+234',
                  ),
                  Text(
                    'ID type',
                  ),
                  SpecialTextfield(
                    innerHint: 'Select ID type',
                  ),
                ],
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LightExpandedButton(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const CustomBottomSheet());
                  },
                  title: 'Continue',
                ),
              )
            ])));
  }
}

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  VerificationDoc verificationDoc = VerificationDoc.bvn;
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('ID type'),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
              const Card(
                color: Color(0xff82FC57),
                child: SizedBox(
                    height: 20,
                    width: 120,
                    child: Center(child: Text('Recommended'))),
              ),
              ...List.generate(
                VerificationDoc.values.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      verificationDoc = VerificationDoc.values[index];
                    });
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PassportVerification(),
                        ));
                  },
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(VerificationDoc.values[index].title),
                        verificationDoc == VerificationDoc.values[index]
                            ? const Icon(
                                Icons.check_circle_sharp,
                                color: Colors.black,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Your information is only used for identity verification',
                  style: AppTextStyles.tiny,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
