import 'package:elearning/app/controller/AssessmentController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/AssessmentModule.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/widgets/EmptyCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CourseAccessmentListPage extends GetView<AssessmentController> {
  late final ThemeData themeData;
  late List<AssessmentModule> _moduleList;
  late int _attemptCount;
  final AppPref _appPref = Get.find<AppPref>();
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Assessment List')),
      body: SafeArea(
        child: Obx(
          () {
            _attemptCount = controller.attemptCount;
            _moduleList = controller.assessmensModuleList;
            return CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        _moduleList.length > 0 ? _builder : _emptyBuilder,
                        childCount:
                            _moduleList.length > 0 ? _moduleList.length : 1)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget? _builder(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        _appPref.testId.val = _moduleList[index].testId!;
        _appPref.assessmentModule.val = _moduleList[index];
        Get.toNamed(Routes.ASSESSMENT_CONFIRMATION_PAGE);
      },
      child: Card(
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
            child: Text("${_moduleList[index].moduleName}",
                style: themeData.textTheme.bodyText1),
          ),
          subtitle: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "Status : ${_moduleList[index].status}",
                    style: themeData.textTheme.bodyText2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   "Max Attempt : ${_moduleList[index].maxAttempts}",
                      //   style: themeData.textTheme.bodyText2,
                      // ),
                      Text(
                        "Attempted Count : ${_moduleList[index].attemptCount}/${_moduleList[index].maxAttempts}",
                        style: themeData.textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget? _emptyBuilder(BuildContext context, int index) {
    return emptyCard(controller.emptyText, controller.emptyMessage);
  }
}
