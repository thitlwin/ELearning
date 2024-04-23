import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:elearning/app/controller/SlideController.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/widgets/TwoLinesTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SlideVideoPortraitPage extends GetView<SlideController> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return GetX<SlideController>(
      initState: (state) {
        if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      },
      builder: (controller) {
        print(
            "controller.isVideoPlayerControllerInitiallzed.value ===>${controller.isVideoPlayerControllerInitiallzed.value}");
        return Scaffold(
          appBar: AppBar(
            title: twoLinesTitle(
                "${controller.courseName!}", 'Elearning-VideoSlide'),
          ),
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  Stack(children: [
                    controller.isVideoUrlEmpty.value
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.grey),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            child: Center(
                              child: Text(
                                "Video url is empty.",
                                style: themeData.textTheme.headline6,
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.grey),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            child: controller
                                    .isVideoPlayerControllerInitiallzed.value
                                ? Chewie(
                                    controller: controller.chewieController,
                                  )
                                : Container(
                                    width: 100,
                                    height: 100,
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  ),
                          ),
                    Positioned(
                      bottom: 15,
                      right: 15,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.ELEARNING_SLIDE_VIDEO_LANDSCAPE);
                        },
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                        ),
                      ),
                    )
                  ]),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: Colors.white),
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                          child: Text(controller.comment)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color:
                                        themeData.colorScheme.secondaryVariant),
                              ),
                            ),
                          ),
                          onPressed: () {
                            controller.markModuleAsCompleted();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('Mark as Completed'),
                          ),
                        ),
                      ],
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
}
