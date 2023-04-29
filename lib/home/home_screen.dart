import 'package:flutter/material.dart';
import 'package:islami/home/tasbeh/tasbeh_tab.dart';

import 'hadeth/hadeth_tab.dart';
import 'quran/quran_tab.dart';
import 'radio/radio_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> screensTab = [QuranTab(), HadethTab(), TasbehTab(), RadioTab()];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/main_background.png"),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Islami"),
        ),
        body: screensTab[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(AssetImage("assets/images/ic_quran.png")),
              label: "Quran",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(AssetImage("assets/images/ic_hadeth.png")),
              label: "Hadeth",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(AssetImage("assets/images/ic_sebha.png")),
              label: "Tasbeh",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(AssetImage("assets/images/ic_radio.png")),
              label: "Radio",
            ),
          ],
        ),
      ),
    );
  }
}
