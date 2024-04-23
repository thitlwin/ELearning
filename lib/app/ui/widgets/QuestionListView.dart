import 'package:elearning/app/controller/TestQuestionController.dart';
import 'package:elearning/app/data/model/AssessmentQuestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class QuestionListView extends StatefulWidget {
  final int assessmentQuestionLength;
  final List<AssessmentQuestion> assessmentQuestionList;

  const QuestionListView(
      {Key? key,
      required this.assessmentQuestionList,
      required this.assessmentQuestionLength})
      : super(key: key);

  @override
  _QuestionListViewState createState() => _QuestionListViewState();
}

class _QuestionListViewState extends State<QuestionListView> {
  final TestQuestionController testQuestionController = Get.find();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Questions",
        style: TextStyle(color: Colors.black),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      actions: <Widget>[],
      content: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Divider(),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.assessmentQuestionLength,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: ListTile(
                        onTap: () {
                          print("index => $index");
                          Get.back();
                          testQuestionController.notifyObsValueChange(index);
                        },
                        title: Padding(
                          padding: EdgeInsets.only(top: 0, bottom: 0, left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${index + 1}. ${widget.assessmentQuestionList[index].questionName}",
                              ),
                            ],
                          ),
                        ),
                        // Divider(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
