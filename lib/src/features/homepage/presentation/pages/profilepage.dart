import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';

import '../../../../../style/textstyles.dart';
import '../../../../../utils/screensizeutils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Afolabi Philemon',
                style: AppTextStyles.medium.w500,
              ),
              subtitle: const Text('adphill128@gmail.com'),
              trailing: const CircleAvatar(),
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'PERSONAL DETAILS',
                style: AppTextStyles.tiny,
              ),
            ),
            Card(
                margin: const EdgeInsets.only(top: 5),
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
                        onTap: () {},
                        trailing: const Text('Philemon'),
                        minLeadingWidth: 0,
                        title: const Text(
                          'First Name',
                          style: AppTextStyles.tiny,
                        ),
                      ),
                      const ListTile(
                        minLeadingWidth: 0,
                        trailing: Text('Afolabi'),
                        title: Text(
                          'Last Name',
                          style: AppTextStyles.tiny,
                        ),
                      ),
                      const ListTile(
                        minLeadingWidth: 0,
                        trailing: Text(
                          '9017978394',
                          style: AppTextStyles.tiny,
                        ),
                        title: Text(
                          'Phone Number',
                          style: AppTextStyles.tiny,
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
