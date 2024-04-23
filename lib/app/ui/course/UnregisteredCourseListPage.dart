import 'package:elearning/app/controller/CourseController.dart';
import 'package:elearning/app/data/model/Course.dart';
import 'package:elearning/app/ui/widgets/CourseListItemWidget.dart';
import 'package:elearning/app/ui/widgets/EmptyCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnregisteredCourseListPage extends GetView<CourseController> {
  late final ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return GetX<CourseController>(
      builder: (controller) {
        // debugPrint("--builder------");
        return Scaffold(
          appBar: AppBar(title: Text('Register a new course')),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  key: UniqueKey(),
                  delegate: SliverChildBuilderDelegate(
                    controller.courseList.length > 0 ? _builder : _emptyBuilder,
                    childCount: controller.courseList.length > 0
                        ? controller.courseList.length
                        : 1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget? _emptyBuilder(BuildContext context, int index) {
    return emptyCard(controller.emptyText, controller.emptyMessage);
  }

  Widget? _builder(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        _displayConfirmationDialog(controller.courseList[index]);
      },
      child: CourseListItemWidget("${controller.courseList[index].courseName}"),
    );
  }

  void _displayConfirmationDialog(Course course) {
    Get.dialog(AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Are you sure you want to register the following course? ",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            "${course.courseName}",
            style: themeData.textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel')),
        ElevatedButton(
            onPressed: () {
              controller.registerCourse(course);
              Get.back();
            },
            child: Text('Yes'))
      ],
    ));
  }
}
