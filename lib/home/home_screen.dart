import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/settings/settings_screen.dart';
import 'package:islami/home/tasbeh/tasbeh_tab.dart';
import 'package:provider/provider.dart';

import 'hadeth/hadeth_tab.dart';
import 'provider/settings_provider.dart';
import 'quran/quran_tab.dart';
import 'radio/radio_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> screensTab = [
    QuranTab(),
    HadethTab(),
    TasbehTab(),
    RadioTab(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(settingsProvider.getMainBackGround()),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.app_title),
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
              label: AppLocalizations.of(context)!.quran_title,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(AssetImage("assets/images/ic_hadeth.png")),
              label: AppLocalizations.of(context)!.hadeth_title,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(AssetImage("assets/images/ic_sebha.png")),
              label: AppLocalizations.of(context)!.tasbeh_title,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(AssetImage("assets/images/ic_radio.png")),
              label: AppLocalizations.of(context)!.radio_title,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings_title,
            ),
          ],
        ),
      ),
    );
  }
}
