import 'package:elearning/app/controller/SlideController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class SlideImagePage extends GetView<SlideController> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return GetX<SlideController>(
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text('Slide Image')),
          body: controller.isContentEmpty.value
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
                      child: Text("Empty slide image."),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.imageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final url = controller.imageList[index].file_url;
                          final tag = controller.imageList[index].slideNo;
                          return InkWell(
                            onTap: () => Get.to(
                              () => InkWell(
                                child: Scaffold(
                                  appBar:
                                      AppBar(title: Text('Slide Image Detail')),
                                  body: Container(
                                    child: PhotoView(
                                      imageProvider: NetworkImage(url),
                                      loadingBuilder: (context, event) =>
                                          Center(
                                        child: Container(
                                          // width: 20.0,
                                          // height: 20.0,
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                      heroAttributes: PhotoViewHeroAttributes(
                                        tag: tag,
                                      ),
                                      initialScale:
                                          PhotoViewComputedScale.contained *
                                              0.98,
                                      minScale:
                                          PhotoViewComputedScale.contained *
                                              0.8,
                                      maxScale:
                                          PhotoViewComputedScale.covered * 2,
                                      enableRotation: true,
                                      backgroundDecoration:
                                          BoxDecoration(color: Colors.white),
                                      gaplessPlayback: true,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                              child: Hero(
                                tag: tag,
                                child: Image.network(
                                  url,
                                  fit: BoxFit.contain,
                                  height: MediaQuery.of(context).size.height *
                                      0.259,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                        child: CircularProgressIndicator());
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
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
                                child: Text(
                                  'Mark as Completed',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}
