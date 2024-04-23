import 'package:elearning/app/controller/HomeController.dart';
import 'package:elearning/app/data/model/Course.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CourseDetailPage extends GetView {
  Course _registeredCourse = Get.arguments;
  final HomeController homeController = Get.find();
  late bool isUpdatInLocal;
  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    // print(myCourse.courseId);
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '${_registeredCourse.courseName}',
        style: _themeData.textTheme.headline6,
      )),
      body: Obx(
        () {
          isUpdatInLocal = homeController.isUpdateCourseInLocal.value;
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.COURSE_MODULE_LIST,
                            arguments: _registeredCourse);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                "assets/icons/modules.svg",
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                // width: 150,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Text("${homeController.courseName}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Text("E-learning Slides",
                                    style: _themeData.textTheme.bodyText1),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                  '${homeController.completionElearn} % completion'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.COURSE_ASSESSMENT_LIST_PAGE,
                            arguments: _registeredCourse);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        // margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                "assets/icons/assessment.svg",
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: 150,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Text("${homeController.courseName}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Text("Assessments",
                                    style: _themeData.textTheme.bodyText1),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                  '${homeController.completionAssesment} % completion'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
