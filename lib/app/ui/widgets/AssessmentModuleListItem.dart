import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AssessmentModuleListItem extends GetWidget {
  final String moduleName;
  final String attempts;
  final String status;

  AssessmentModuleListItem(this.moduleName, this.attempts, this.status);
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      color: Colors.white,
      elevation: 2,
      child: ListTile(
        leading: SvgPicture.asset(
          "assets/icons/assessment.svg",
          width: 45,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text("$moduleName", style: themeData.textTheme.bodyText1),
        ),
        subtitle: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  "Attempts : $attempts",
                  style: themeData.textTheme.bodyText2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  "Status : $status",
                  style: themeData.textTheme.bodyText2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Container(
    //   decoration:
    //       BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
    //   margin: EdgeInsets.all(8.0),
    //   padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
    //   child: Column(
    //     children: [
    //       Center(
    //         child: Text(
    //           "$moduleName",
    //           textAlign: TextAlign.center,
    //           // style: TextStyle(fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 32.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               "Attempts : $attempts",
    //             ),
    //             Text("Status : $status"),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
