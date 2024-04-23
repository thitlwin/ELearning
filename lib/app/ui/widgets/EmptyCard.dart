import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget emptyCard(String svgIcon, String message) {
  return Builder(
    builder: (BuildContext context) {
      // ThemeData themeData = Theme.of(context);
      return Container(
        height: MediaQuery.of(context).size.height / 1.1,
        child: Center(
          child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "$svgIcon",
                  color: Colors.black38,
                  width: 50,
                ),
                Text(
                  "\n$message",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
