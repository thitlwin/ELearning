import 'package:elearning/app/controller/HomeController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/widgets/CourseListItemWidget.dart';
import 'package:elearning/app/ui/widgets/NotiWidget.dart';
import 'package:elearning/app/ui/widgets/TwoLinesTitle.dart';
import 'package:elearning/app/utils/StringUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  late final ThemeData themeData;
  late bool isUpdateInLocal;
  var _pref = Get.put(AppPref());
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: twoLinesTitle(appName, appVersion),
        actions: [notificationIcon()],
      ),
      body: SafeArea(
        child: Obx(
          () {
            isUpdateInLocal = controller.isUpdateCourseInLocal.value;
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.COURSE_LIST);
                        },
                        splashColor: themeData.splashColor,
                        child: CourseListItemWidget(
                            'You have yet to register in any module?\nClick here to register one now.'),
                      );
                    },
                    childCount: 1,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      controller.registeredCourseList.length > 0
                          ? _builder
                          : _emptyBuilder,
                      childCount: controller.registeredCourseList.length > 0
                          ? controller.registeredCourseList.length
                          : 1),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget? _emptyBuilder(BuildContext context, int index) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.7,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "${controller.emptyText}",
              color: Colors.black38,
              width: 30,
            ),
            Text(
              "\n${controller.emptyMessage}",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? _builder(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      color: Colors.white,
      elevation: 2,
      child: ListTile(
        onTap: () {
          controller.isUpdateCourseInLocal.value = false;
          controller.completionAssesment =
              controller.registeredCourseList[index].assessmentPercentage;
          controller.completionElearn =
              controller.registeredCourseList[index].slidesPercentage;
          controller.courseName =
              controller.registeredCourseList[index].courseName;
          controller.selectedRegisteredCourseIndex = index;
          Get.toNamed(Routes.COURSE_DETAIL,
              arguments: controller.registeredCourseList[index]);
        },
        leading: SvgPicture.asset(
          "assets/icons/course.svg",
          width: 45,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text("${controller.registeredCourseList[index].courseName}",
              style: themeData.textTheme.bodyText1),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            "${controller.registeredCourseList[index].coursePercentage != null ? controller.registeredCourseList[index].coursePercentage : 0.0} % Completion",
            style: themeData.textTheme.bodyText2,
          ),
        ),
      ),
    );
  }
}
