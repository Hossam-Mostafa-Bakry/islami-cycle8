import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_details.dart';

import 'home/home_screen.dart';
import 'home/quran/sura_details_screen.dart';
import 'my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      routes: {
        HomeScreen.routName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      initialRoute: HomeScreen.routName,
    );
  }
}
