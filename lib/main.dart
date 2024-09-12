import 'package:flutter/material.dart';
import 'package:nfcapp/src/features/onboarding/presentation/pages/onboardingpage.dart';
import 'package:nfcapp/style/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppThemes.darkTheme,
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.system,
      home: const OnboardingPage(),
    );
  }
}
