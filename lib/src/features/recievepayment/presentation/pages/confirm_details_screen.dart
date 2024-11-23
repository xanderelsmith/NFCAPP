import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/src/features/recievepayment/presentation/pages/viewaccountdetailscreen.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/style/textstyles.dart';
import 'package:nfcapp/utils/appstrings.dart';

class ConfirmDetailsScreen extends StatelessWidget {
  const ConfirmDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('Get an NGA Bank Account',
                  style: AppTextStyles.tinygrey12.w400.copyWith(
                    color: AppColors.textGrey,
                  )),
            ),
            Text(
              'Confirm your name',
              style: AppTextStyles.medium20.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                  top: 16,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.circleAvatarColor)),
                height: 56,
                width: double.maxFinite,
                child: Text(
                  AppString.confirmDetails,
                  style: AppTextStyles.minute8.w400,
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 24, left: 8, right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.circleAvatarColor)),
                height: 110,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 24,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'First Name',
                            style: AppTextStyles.tiny10.w400,
                          ),
                          Text(
                            'Philemon',
                            style: AppTextStyles.tiny10.w600,
                          ),
                        ],
                      ),
                      const Divider(
                        color: AppColors.dividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Last Name',
                            style: AppTextStyles.tiny10.w400,
                          ),
                          Text(
                            'Afolabi',
                            style: AppTextStyles.tiny10.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(
                    bottom: 16.0, left: 20, right: 20, top: 36),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ViewAccounDetailsScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                        fixedSize: const Size(double.maxFinite, 39)),
                    child: Text('Continue',
                        style: AppTextStyles.tiny10.w600.copyWith(
                          color: AppColors.white,
                        )))),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel and go back',
                  style: AppTextStyles.tiny10.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
