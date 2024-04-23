import 'package:chewie/chewie.dart';
import 'package:elearning/app/controller/CourseModuleController.dart';
import 'package:elearning/app/controller/HomeController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/Module.dart';
import 'package:elearning/app/data/model/Photo.dart';
import 'package:elearning/app/data/repository/ElearningSlideRepository.dart';
import 'package:elearning/app/utils/StringUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SlideController extends GetxController {
  final AppPref _appPref = Get.find<AppPref>();
  final ElearningSlideRepository repository;
  final isVideoPlayerControllerInitiallzed = false.obs;
  final isVideoUrlEmpty = false.obs;
  final isPdfUrlEmpty = false.obs;
  final isEmbedCodeEmpty = false.obs;

  CourseModuleController courseModuleController = Get.find();
  // late final VideoPlayerController videoPlayerController;
  // late final FlickManager flickManager;

  SlideController({required this.repository});

  final HomeController homeController = Get.find();

  var isOrientationLandscape = false.obs;
  var stringWidth = 0.obs;
  var stringHeight = 0.obs;
  var googleSlideEmbeddedCode = "";
  String htmlContent = "";
  PDFDocument? pdfDocument;
  var isLoadingPdf = true.obs;

  final _courseName = "".obs;
  get courseName => this._courseName.value;
  set courseName(value) => this._courseName.value = value;

  final _embedCode = "".obs;
  get embedCode => this._embedCode.value;
  set embedCode(value) => this._embedCode.value = value;

  // final _videoFileUrl = "".obs;
  // get videoFileUrl => this._videoFileUrl.value;
  // set videoFileUrl(value) => this._videoFileUrl.value = value;

  final _pdfDocumentUrl = "".obs;
  get pdfDocumentUrl => this._pdfDocumentUrl.value;
  set pdfDocumentUrl(value) => this._pdfDocumentUrl.value = value;

  var isContentEmpty = false.obs;

  final _imageList = Rx<List<Photo>>([]);
  get imageList => this._imageList.value;
  set imageList(value) => this._imageList.value = value;
  // String comment = """No comment.""";

  final _comment = "No comment.".obs;
  get comment => this._comment.value;
  set comment(value) => this._comment.value = value;

  late final chewieController;
  late final videoPlayerController;
  late final int selectedCourseModuleListIndex;

  @override
  void onInit() {
    selectedCourseModuleListIndex = Get.arguments;
    Module module =
        courseModuleController.moduleList.value[selectedCourseModuleListIndex];
    debugPrint(
        "selectedCourseModuleListIndex----$selectedCourseModuleListIndex");
    debugPrint(
        "courseModuleController.moduleList.length----${courseModuleController.moduleList.length}");
    // final employeeId = ;
    // final moduleNo = _appPref.moduleNo;
    // final courseId = _appPref.courseID;
    print('-----onInit @ SlideController-------');
    _preloadModuleSlideList(
        module.moduleId!, module.courseId!, _appPref.employeeId.val);
    super.onInit();
  }

  @override
  void onClose() {
    if (isVideoPlayerControllerInitiallzed.value) {
      videoPlayerController.dispose();
      chewieController!.dispose();
    }
    super.onClose();
  }

  void _preloadModuleSlideList(int moduleId, String courseId, int employeeId) {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false);
    repository.getModuleDslideList(moduleId, courseId, employeeId).then(
      (value) {
        if (value!.responseCode.toString() == "1") {
          debugPrint(
              "value.moduleDetail.learningModeId ====>${value.moduleDetail.learningModeId}");
          debugPrint("ModuleDetail ====>${value.moduleDetail.file_url}");
          courseName = value.moduleDetail.courseName;
          if (value.moduleDetail.learningModeId == 1) {
            if (value.moduleDetail.embedCode == null) {
              EasyLoading.showError("Google Slide is empty.");
              isEmbedCodeEmpty.value = true;
              EasyLoading.dismiss();
            } else {
              embedCode = value.moduleDetail.embedCode;
            }
            if (value.moduleDetail.moduleDescription != null) {
              comment = value.moduleDetail.moduleDescription;
            }
          } else if (value.moduleDetail.learningModeId == 3) {
            var videoFileUrl = value.moduleDetail.file_url;
            if (value.moduleDetail.moduleDescription != null) {
              comment = value.moduleDetail.moduleDescription;
            }
            if (videoFileUrl == null) {
              EasyLoading.showError("Video url is empty.");
              isVideoUrlEmpty.value = true;
              EasyLoading.dismiss();
            } else {
              videoPlayerController =
                  VideoPlayerController.network("$videoFileUrl");

              videoPlayerController.initialize().then((value) {
                isVideoPlayerControllerInitiallzed.value = true;
                EasyLoading.dismiss();
                chewieController = ChewieController(
                  videoPlayerController: videoPlayerController,
                  autoPlay: true,
                  looping: false,
                  allowFullScreen: false,
                  allowPlaybackSpeedChanging: false,
                  allowedScreenSleep: false,
                );
              });
            }
          } else if (value.moduleDetail.learningModeId == 4) {
            if (value.moduleDetail.file_url == null) {
              EasyLoading.showError("PDF is empty");
              isPdfUrlEmpty.value = true;
              EasyLoading.dismiss();
            } else {
              pdfDocumentUrl = value.moduleDetail.file_url;
              loadDocument(pdfDocumentUrl);
              EasyLoading.dismiss();
            }
          } else if (value.moduleDetail.learningModeId == 7) {
            imageList = value.moduleDetail.imageList;
            if (value.moduleDetail.imageList!.length == 0)
              isContentEmpty.value = true;
            EasyLoading.dismiss();
          } else {
            print('It may be another learning mode');
          }
        } else {
          EasyLoading.showError(value.responseMessage.toString(),
              dismissOnTap: false);
        }
      },
    ).onError((error, stackTrace) {
      // print("Error=========> $stackTrace");
      EasyLoading.showError("Something wrong.", dismissOnTap: false);
    });
  }

  void loadDocument(pdfDocumentUrl) async {
    pdfDocument = await PDFDocument.fromURL(pdfDocumentUrl);
    isLoadingPdf.value = false;
  }

  void markModuleAsCompleted() {
    // keep old list to update UI's list
    var originalModuleList = <Module>[];
    originalModuleList.addAll(courseModuleController.moduleList);

    EasyLoading.show(status: "Please wait...", dismissOnTap: false);
    repository
        .markCourseAsCompleted(_appPref.employeeId.val,
            int.parse(_appPref.courseID.val), _appPref.moduleId.val)
        .then((value) {
      EasyLoading.dismiss();
      if (value!.responseCode.toString() == "1") {
        Module selectedModule =
            courseModuleController.moduleList[selectedCourseModuleListIndex];

        selectedModule.status = value.status;
        originalModuleList[selectedCourseModuleListIndex] = selectedModule;
        //clear UI's list & add with kept list value
        courseModuleController.moduleList.clear();
        courseModuleController.moduleList.addAll(originalModuleList);

        //updating completion of courseCompletion(registerCourseList at home page) and slideCompletion(in CourseDetail page)
        updateCompletion(value.coursePercentage, value.slidesPercentage);

        EasyLoading.showSuccess("Successfully marked as completed.");
      } else {
        EasyLoading.showError(value.responseMessage.toString());
      }
    }).onError((error, stackTrace) {
      EasyLoading.showError(unknownErrorMessage);
    });
  }

  void updateCompletion(double? coursePercentage, double? slidesPercentage) {
    //update in course detail page
    homeController.completionElearn = slidesPercentage;
    //update registeredCourseList at home page
    homeController
        .registeredCourseList[homeController.selectedRegisteredCourseIndex]
        .coursePercentage = coursePercentage;
    homeController
        .registeredCourseList[homeController.selectedRegisteredCourseIndex]
        .slidesPercentage = slidesPercentage;

    //listen ,Is update the completion percentage change
    homeController.isUpdateCourseInLocal.value = true;
  }
}
