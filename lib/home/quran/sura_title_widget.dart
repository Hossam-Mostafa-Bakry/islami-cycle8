import 'package:flutter/material.dart';

import 'sura_details_screen.dart';
import 'sura_details_screen_args.dart';

class SuraTilteWidget extends StatelessWidget {
  String title;
  int index;

  SuraTilteWidget({
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetailsScreen.routeName,
          arguments: SuraDetailsScreenArs(
            title: title,
            index: index,
          ),
        );

        // index
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
