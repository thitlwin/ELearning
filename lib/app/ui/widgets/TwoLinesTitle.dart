import 'package:flutter/material.dart';

Widget twoLinesTitle(String title, String subTitle) {
  return Builder(
    builder: (BuildContext context) {
      ThemeData themeData = Theme.of(context);
      return Column(children: [
        Text(
          title,
          style: themeData.textTheme.headline6,
        ),
        Text(
          subTitle,
          style: themeData.textTheme.caption,
        )
      ]);
    },
  );
}
