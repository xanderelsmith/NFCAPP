import 'package:flutter/material.dart';

import '../../../../../style/color.dart';
import '../../../../../style/textstyles.dart';

class CurrencyAmountPreviewWidget extends StatelessWidget {
  const CurrencyAmountPreviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'images/naira.png',
              height: 9,
            ),
          ),
          const Text(
            '0.00',
            style: AppTextStyles.currencybold,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Icon(
              Icons.visibility_off_outlined,
              size: 20,
              color: AppColor.blue,
            ),
          ),
        ],
      ),
    );
  }
}
