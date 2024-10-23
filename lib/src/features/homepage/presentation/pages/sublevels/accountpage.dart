import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/style/textstyles.dart';

import '../../../../../../utils/screensizeutils.dart';
import '../profilepage.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({
    super.key,
  });

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  AccountVerificationState accountVerificationState =
      AccountVerificationState.verified;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account',
            style: AppTextStyles.medium.w500,
          ),
          Center(
            child: Card(
                margin: const EdgeInsets.only(top: 24),
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Color(0xffF6F6F6),
                    width: 2,
                  ),
                ),
                child: SizedBox(
                  width: getScreenSize(context).width,
                  height: 206,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ));
                        },
                        minLeadingWidth: 0,
                        leading: Icon(
                          Icons.person_2,
                          color: AppColor.blue,
                          size: 20,
                        ),
                        title: Text(
                          'Your Profile',
                          style: AppTextStyles.tiny,
                        ),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        leading: const Icon(
                          Icons.person_2,
                          color: AppColor.blue,
                          size: 20,
                        ),
                        trailing: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: accountVerificationState ==
                                    AccountVerificationState.verified
                                ? null
                                : accountVerificationState.color
                                    .withOpacity(0.25),
                            foregroundColor: accountVerificationState.color,
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            fixedSize: const Size(100, 15),
                            shape: RoundedRectangleBorder(
                              side: (accountVerificationState ==
                                      AccountVerificationState.verified)
                                  ? BorderSide(
                                      width: 2,
                                      color: accountVerificationState.color)
                                  : BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            accountVerificationState.message,
                            style: AppTextStyles.tiny,
                          ),
                        ),
                        title: const Text(
                          'Account Verification',
                          style: AppTextStyles.tiny,
                        ),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        leading: const Icon(
                          Icons.tune_rounded,
                          color: AppColor.blue,
                          size: 20,
                        ),
                        trailing: Switch(
                          splashRadius: 12,
                          value: accountVerificationState ==
                              AccountVerificationState.verified,
                          trackColor: WidgetStateColor.resolveWith(
                              (states) => AppColor.black),
                          onChanged: (value) {
                            setState(() {
                              accountVerificationState =
                                  accountVerificationState ==
                                          AccountVerificationState.verified
                                      ? AccountVerificationState.notverified
                                      : AccountVerificationState.verified;
                            });
                          },
                        ),
                        title: const Text(
                          'Enable Dark Mode',
                          style: AppTextStyles.tiny,
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}

enum AccountVerificationState {
  notverified('Needs Attention', AppColor.red),
  verified('VERIFIED', Color(0xff4ED775));

  const AccountVerificationState(this.message, this.color);
  final String message;
  final Color color;
}
