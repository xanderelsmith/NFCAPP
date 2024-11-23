import 'package:flutter/material.dart';
import 'package:nfcapp/provider/themeprovider.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/onboardingpage.dart';
import 'package:nfcapp/style/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: Builder(builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            darkTheme: AppThemes.darkTheme,
            theme: AppThemes.lightTheme,
            themeMode:
                themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const OnboardingPage(),
          );
        }));
  }
}
