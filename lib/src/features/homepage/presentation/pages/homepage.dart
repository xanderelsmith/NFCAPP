import 'package:flutter/material.dart';
import 'package:nfcapp/src/features/homepage/presentation/pages/sendmoneyscreen.dart';
import 'package:nfcapp/src/features/homepage/presentation/pages/sublevels/accountpage.dart';
import 'package:nfcapp/src/features/homepage/presentation/pages/sublevels/homedashboard.dart';
import 'package:nfcapp/src/features/homepage/presentation/widgets/customnavigationbar.dart';
import 'package:nfcapp/style/color.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  BottomNavPages bottomNavPage = BottomNavPages.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedColor: AppColors.blue,
          currentIndex: bottomNavPage.index,
          onTap: (index) {
            setState(() {
              bottomNavPage = BottomNavPages.values[index];
            });
          },
          enableFeedback: false,
          items: BottomNavPages.values
              .map((e) => BottomNavigationBarItem(
                    icon: Image.asset(
                      e.icon,
                      color: e == bottomNavPage
                          ? AppColors.blue
                          : AppColors.iconColorgrey,
                    ),
                    label: e.name,
                  ))
              .toList()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: getHomepageCurrentScreen(bottomNavPage),
        ),
      ),
    );
  }
}

enum BottomNavPages {
  home('Home', 'images/home.png'),
  send('Send', 'images/send.png'),
  account('Account', 'images/profile.png');

  const BottomNavPages(this.name, this.icon);
  final String name;
  final String icon;
}

Widget getHomepageCurrentScreen(BottomNavPages bottomNavPages) {
  switch (bottomNavPages) {
    case BottomNavPages.home:
      return const HomeDashboard();
    case BottomNavPages.send:
      return const SendMoneyScreen();
    default:
      return const AccountPage();
  }
}

String formatNumberWithCommas(int number) {
  return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}
