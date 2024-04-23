import 'package:elearning/app/controller/SlideController.dart';
import 'package:elearning/app/ui/widgets/EmptyCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class SlidePdfPage extends GetView<SlideController> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return GetX<SlideController>(
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text('Slide Pdf')),
          body: controller.isPdfUrlEmpty.value
              ? emptyCard("assets/icons/empty.svg", "PDF url is empty.")
              : Column(
                  children: [
                    Flexible(
                      child: Container(
                        child: Center(
                          child: controller.isLoadingPdf.value
                              ? Center(child: CircularProgressIndicator())
                              : PDFViewer(
                                  document: controller.pdfDocument!,
                                  zoomSteps: 1,
                                ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
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
                                  child: Text('Mark as Completed'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
