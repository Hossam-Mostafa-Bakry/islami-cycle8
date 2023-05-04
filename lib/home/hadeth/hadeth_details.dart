import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_data_class.dart';
import 'package:provider/provider.dart';

import '../provider/settings_provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "hadeth-details";

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as HadethDataClass;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(settingsProvider.getMainBackGround()),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Islami"),
        ), //
        body: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 65),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      args.title,
                      style: const TextStyle(fontSize: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Divider(
                        thickness: 1.2,
                        color: Theme
                            .of(context)
                            .accentColor,
                      ),
                    ),
                    Text(args.content, textDirection: TextDirection.rtl),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
