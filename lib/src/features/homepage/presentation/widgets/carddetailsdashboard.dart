import 'package:flutter/material.dart';
import 'package:nfcapp/provider/themeprovider.dart';
import 'package:nfcapp/src/features/homepage/presentation/widgets/currencyamountpreviewwidget.dart';
import 'package:provider/provider.dart';

import '../../../../../style/color.dart';
import '../../../../../style/textstyles.dart';
import '../../../../../utils/screensizeutils.dart';
import '../../data/enum/currency.dart';
import '../../data/enum/homeactions.dart';

class CardDetailsDashboard extends StatelessWidget {
  const CardDetailsDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Card(
      margin: const EdgeInsets.only(top: 45),
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
        width: getScreenSize(context).width - 50,
        height: 206,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 24,
                width: 80,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.blue,
                      width: 2,
                    )),
                child: Row(
                  children: [
                    Image.asset(
                      'images/naira.png',
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      height: 12,
                    ),
                    Expanded(
                      child: DropdownButton(
                        underline: const SizedBox(),
                        icon: Image.asset(
                          'images/arrowdown.png',
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                        value: Currency.dollar,
                        items: Currency.values
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e.name,
                                  style: AppTextStyles.tiny10.copyWith(
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: CurrencyAmountPreviewWidget(),
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  HomeActionKeys.values.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => getHomeActionScreen(
                                HomeActionKeys.values[index]),
                          ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.circleAvatarColor,
                            child: Image.asset(
                              HomeActionKeys.values[index].imagesrc,
                              height: 27,
                              color: AppColors.iconColorgrey,
                            )),
                        Text(
                          HomeActionKeys.values[index].text,
                          style: AppTextStyles.minute8,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
