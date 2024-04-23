import 'package:elearning/app/controller/CourseModuleController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/Module.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/widgets/CourseModuleListItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CourseModuleListPage extends GetView<CourseModuleController> {
  var _appPref = Get.put(AppPref());
  late final ThemeData themeData;
  // late List<Module> _moduleList;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return GetX<CourseModuleController>(
      builder: (controller) {
        debugPrint(
            'at builder :: courseModule List---------${controller.moduleList.length}');
        // _moduleList = controller.moduleList.value;
        return Scaffold(
          appBar: AppBar(
            title: Text('Course Module List'),
          ),
          body: SafeArea(
            child: controller.isContentEmpty.value
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/empty.svg",
                        width: 40,
                        color: Colors.black38,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text("Empty course module."),
                      ),
                    ],
                  )
                : CustomScrollView(
                    slivers: [
                      SliverList(
                        key: UniqueKey(),
                        delegate: SliverChildBuilderDelegate(_builder,
                            childCount: controller.moduleList.length),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  Widget? _builder(BuildContext context, int index) {
    Module module = controller.moduleList[index];
    final deviceOrientation = MediaQuery.of(context).orientation;
    var svgIcon;
    if (module.learningModeId == 1) {
      //1.GoogleSlide Presentation
      svgIcon = "assets/icons/slide.svg";
    } else if (module.learningModeId == 3) {
      //3.Video
      svgIcon = "assets/icons/video.svg";
    } else if (module.learningModeId == 4) {
      //4.Document
      svgIcon = "assets/icons/document.svg";
    } else if (module.learningModeId == 7) {
      //7.Image
      svgIcon = "assets/icons/image-gallery.svg";
    } else if (module.learningModeId == 8) {
      //PowerPoint
      svgIcon = "assets/icons/ppt.svg";
    } else {
      svgIcon = "assets/icons/cloud.svg";
    }
    return InkWell(
        onTap: () {
          _appPref.moduleId.val = module.moduleId!;
          // _appPref.moduleNo.val = module.moduleNo!;
          _appPref.courseID.val = module.courseId!;
          if (module.learningModeId == 1) {
            //1.GoogleSlide Presentation
            deviceOrientation == Orientation.landscape
                ? Get.toNamed(Routes.ELEARNING_SLIDE_LANDSCAPE,
                    arguments: index)
                : Get.toNamed(Routes.ELEARNING_SLIDE_PORTRAIT,
                    arguments: index);
          } else if (module.learningModeId == 3) {
            //3.Video
            if (deviceOrientation == Orientation.landscape) {
              Get.toNamed(Routes.ELEARNING_SLIDE_VIDEO_LANDSCAPE,
                  arguments: index);
            } else {
              Get.toNamed(Routes.ELEARNING_SLIDE_VIDEO_PORTRAIT,
                  arguments: index);
            }
          } else if (module.learningModeId == 4) {
            //4.pdf
            Get.toNamed(Routes.ELEARNING_SLIDE_PDF, arguments: index);
          } else if (module.learningModeId == 7) {
            //7.Image
            Get.toNamed(Routes.ELEARNING_SLIDE_IMAGE, arguments: index);
          } else if (module.learningModeId == 8) {
            //8.PowerPoint
            debugPrint('It is power point mode.Comming Soon!');
          }
        },
        child: CourseModuleListItemWidget(
            '"${module.moduleName}"', '"${module.status}"', svgIcon));
  }
}
