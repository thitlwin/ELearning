import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class CourseModuleListItemWidget extends GetWidget {
  final String moduleName;
  final String status;
  final String svgIcon;

  CourseModuleListItemWidget(
       this.moduleName, this.status, this.svgIcon);
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      color: Colors.white,
      elevation: 2,
      child: ListTile(
        leading: SvgPicture.asset(
          svgIcon,
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
                  "Status : $status",
                  style: themeData.textTheme.bodyText2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// Column(
//           children: [
//             Text(
//               "$moduleNo",
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "$moduleName",
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text("$status"),
//               ],
//             ),
//           ],
//         ),
