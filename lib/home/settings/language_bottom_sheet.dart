import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/settings_provider.dart';

class languageBottomSheet extends StatefulWidget {
  const languageBottomSheet({Key? key}) : super(key: key);

  @override
  State<languageBottomSheet> createState() => _languageBottomSheetState();
}

class _languageBottomSheetState extends State<languageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              settingsProvider.changeLanguage("en");
            },
            child: settingsProvider.currentLocal == "en"
                ? getSelectedItem("English")
                : getUnselectedItem("English"),
          ),
          const SizedBox(height: 8.0),
          InkWell(
            onTap: () {
              settingsProvider.changeLanguage("ar");
            },
            child: settingsProvider.currentLocal == "en"
                ? getUnselectedItem("عربي")
                : getSelectedItem("عربي"),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String title) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).accentColor),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }

  Widget getUnselectedItem(String title) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
