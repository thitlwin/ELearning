import 'dart:convert';
import 'dart:io';
import 'package:elearning/app/controller/SlideController.dart';
import 'package:elearning/app/ui/widgets/EmptyCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SlideLandscapePage extends GetView<SlideController> {
  WebViewController? _webViewController;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    // print("Device orientation===========> ${context.orientation} ");

    return GetX<SlideController>(
      initState: (state) {
        if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      },
      builder: (controller) {
        String _url = """<!DOCTYPE html>
                    <html lang="en">
                    <head>
                      <meta charset="utf-8">
                      <meta name="viewport" content="width=device-width, initial-scale=1">
                      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
                      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                    </head>
                    
                    <body>
                    <div id="iframe">
                     ${controller.embedCode}
                     </div>
                    <script>
                      // alert('${MediaQuery.of(context).size.width * 0.97}');
                      // document.getElementsByTagName('iframe')[0].width ='728';
                      // document.getElementsByTagName('iframe')[0].height ='360';
                       document.getElementsByTagName('iframe')[0].width ='${MediaQuery.of(context).size.width * 0.97}';
                      document.getElementsByTagName('iframe')[0].height ='${MediaQuery.of(context).size.height * 0.89}';
                      document.getElementById('iframe').style.marginLeft ='1px';
                      document.getElementById('iframe').style.marginTop ='1px';
                    </script>
                    </body>
                    </html>
                    """;
        // print("Iframe OUT WebController ===>$_url");
        _webViewController?.loadUrl(Uri.dataFromString('$_url',
                mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
            .toString());

        return WillPopScope(
          child: Scaffold(
            body: SafeArea(
              child: controller.isEmbedCodeEmpty.value
                  ? emptyCard(
                      "assets/icons/empty.svg", "Google Slide is empty.")
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Stack(
                        children: [
                          // this hidden view is to remove when the UI use at least one observable variable.
                          Container(
                            width:
                                controller.isOrientationLandscape.value ? 0 : 0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: WebView(
                              javascriptMode: JavascriptMode.unrestricted,
                              onWebViewCreated: (webController) {
                                _webViewController = webController;
                              },
                            ),
                          ),
                          // Positioned(
                          //   left: 0,
                          //   top: MediaQuery.of(context).size.height * 0.4,
                          //   child: InkWell(
                          //     onTap: () {
                          //       debugPrint('to to left');
                          //     },
                          //     child: Icon(Icons.chevron_left_rounded, size: 60),
                          //   ),
                          // ),
                          // Positioned(
                          //   right: 0,
                          //   top: MediaQuery.of(context).size.height * 0.4,
                          //   child: InkWell(
                          //     onTap: () {
                          //       debugPrint('to to right');
                          //     },
                          //     child: Container(
                          //       child: Icon(Icons.chevron_right_rounded, size: 60),
                          //     ),
                          //   ),
                          // ),

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
                                // Get.toNamed(Routes.ELEARNING_SLIDE_PORTRAIT);
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
