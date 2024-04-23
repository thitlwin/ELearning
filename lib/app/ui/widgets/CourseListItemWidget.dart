import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseListItemWidget extends GetWidget {
  final String courseName;

  CourseListItemWidget(this.courseName);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
      child: Column(
        children: [
          Center(
            child: Text(
              "$courseName",
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: Icon(Icons.add_circle_outline, size: 40)),
        ],
      ),
    );
  }
}
