import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:elearning/app/controller/SlideController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SlideVideoLandscapePage extends GetView<SlideController> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return GetX<SlideController>(
      initState: (state) {
        if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
        ]);
      },
      builder: (controller) {
        return WillPopScope(
          child: Scaffold(
            body: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Stack(
                  children: [
                    controller.isVideoUrlEmpty.value
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.grey)),
                            margin: const EdgeInsets.all(8.0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
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
                                border: Border.all(color: Colors.grey)),
                            margin: const EdgeInsets.all(8.0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: controller
                                    .isVideoPlayerControllerInitiallzed.value
                                ? AspectRatio(
                                    aspectRatio: controller
                                        .videoPlayerController
                                        .value
                                        .aspectRatio,
                                    child: Chewie(
                                      controller: controller.chewieController,
                                    ))
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
                          debugPrint('to to portrait');
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.portraitUp,
                            DeviceOrientation.portraitDown
                          ]);
                          Get.back();
                          // Get.offAndToNamed(
                          //     Routes.ELEARNING_SLIDE_VIDEO_PORTRAIT);
                        },
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          onWillPop: onWillPop,
        );
      },
    );
  }

  Future<bool> onWillPop() async {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return true;
  }
}
