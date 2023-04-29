import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'sura_details_screen_args.dart';
import 'verses_widget.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura-details";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    // recive arguments

    SuraDetailsScreenArs args =
        (ModalRoute.of(context)?.settings.arguments) as SuraDetailsScreenArs;

    // index to dedict file == > sura name

    // how to read file

    if (verses.isEmpty) readFile(args.index + 1); // non blocking

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/main_background.png"),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Islami"),
        ), //
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 65),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      VersesWidget(verses[index], index + 1),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      color: Theme.of(context).primaryColor,
                      height: 5,
                    ),
                  ),
                  itemCount: verses.length,
                ),
              ),
      ),
    );
  }

  // async function
  void readFile(int fileIndex) async {
    String fileContent =
        await rootBundle.loadString("assets/files/$fileIndex.txt");
    List<String> lines = fileContent.trim().split('\n');

    // print(lines);
    setState(() {
      verses = lines;
    });
  }
}
