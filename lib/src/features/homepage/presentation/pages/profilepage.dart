import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/provider/themeprovider.dart';
import 'package:nfcapp/style/color.dart';
import 'package:provider/provider.dart';

import '../../../../../style/textstyles.dart';
import '../../../../../utils/screensizeutils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Afolabi Philemon',
                style: AppTextStyles.medium20.w500.copyWith(
                  color: isDark ? AppColors.white : AppColors.black,
                ),
              ),
              subtitle: Text('adphill128@gmail.com',
                  style: TextStyle(
                    color: isDark ? AppColors.white : AppColors.black,
                  )),
              trailing: const CircleAvatar(),
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'PERSONAL DETAILS',
                style: AppTextStyles.tiny10.copyWith(
                  color: isDark ? AppColors.white : AppColors.black,
                ),
              ),
            ),
            Card(
                margin: const EdgeInsets.only(top: 5),
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
                        onTap: () {},
                        trailing: Text('Philemon',
                            style: TextStyle(
                              color: isDark ? AppColors.white : AppColors.black,
                            )),
                        minLeadingWidth: 0,
                        title: Text(
                          'First Name',
                          style: AppTextStyles.tiny10.copyWith(
                            color: isDark ? AppColors.white : AppColors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        trailing: Text('Afolabi',
                            style: TextStyle(
                              color: isDark ? AppColors.white : AppColors.black,
                            )),
                        title: Text(
                          'Last Name',
                          style: AppTextStyles.tiny10.copyWith(
                            color: isDark ? AppColors.white : AppColors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        trailing: Text(
                          '9017978394',
                          style: AppTextStyles.tiny10.copyWith(
                            color: isDark ? AppColors.white : AppColors.black,
                          ),
                        ),
                        title: Text(
                          'Phone Number',
                          style: AppTextStyles.tiny10.copyWith(
                            color: isDark ? AppColors.white : AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
