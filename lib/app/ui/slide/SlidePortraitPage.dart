import 'dart:convert';
import 'dart:io';
import 'package:elearning/app/controller/SlideController.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/widgets/EmptyCard.dart';
import 'package:elearning/app/ui/widgets/TwoLinesTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SlidePortraitPage extends GetView<SlideController> {
  WebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    // print("Device orientation===========> ${context.orientation} ");
    return GetX<SlideController>(
      initState: (state) {
        if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
                      // alert('${MediaQuery.of(context).size.height * 0.383}');
                      document.getElementsByTagName('iframe')[0].width ='${MediaQuery.of(context).size.width * 0.95}';
                      document.getElementsByTagName('iframe')[0].height ='${MediaQuery.of(context).size.height * 0.383}';
                      // document.getElementsByTagName('iframe')[0].width ='390';
                      // document.getElementsByTagName('iframe')[0].height ='305';
                      document.getElementById('iframe').style.marginLeft ="0px";
                    </script>
                    </body>
                    </html>
                    """;
        // print("Iframe OUT WebController ===>$_url");
        _webViewController?.loadUrl(Uri.dataFromString('$_url',
                mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
            .toString());

        return Scaffold(
          appBar: AppBar(
            title: twoLinesTitle("${controller.courseName}", 'E-learning'),
          ),
          body: SafeArea(
              child: controller.isEmbedCodeEmpty.value
                  ? emptyCard(
                      "assets/icons/empty.svg", "Google Slide is empty.")
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Column(
                        children: [
                          // this hidden view is to remove when the UI use at least one observable variable.
                          Stack(children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 8.0),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 2.6,
                              child: WebView(
                                javascriptMode: JavascriptMode.unrestricted,
                                onWebViewCreated: (webController) {
                                  // print("Iframe IN WebController ===>$_url");
                                  _webViewController = webController;
                                },
                                onPageFinished: (String url) {
                                  EasyLoading.dismiss();
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              right: 15,
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.ELEARNING_SLIDE_LANDSCAPE);
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
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: themeData
                                                .colorScheme.secondaryVariant),
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
                    )),
        );
      },
    );
  }

  Future<bool> onWillPop() async {
    return true;
  }
}
