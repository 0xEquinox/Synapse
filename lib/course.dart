import 'dart:collection';
import 'dart:core';
import 'dart:core';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synapse/synapse.dart';
import 'package:synapse/synergy.dart';
import 'Serialization/DeserializeXml.dart';
import 'package:xml/xml.dart';

import 'gradeCalc.dart';
import 'Serialization/DeserializeXml.dart';

class CourseView extends StatefulWidget {
  Course courseData;
  late String gradeString;
  late List<String> categoryListValues;
  late String gradeLetterString;


  CourseView({super.key, required this.courseData}) {
    gradeString = GradeCalculator.calculateGradeDisplay(courseData.marks?.marks?[0] ?? Mark());
    gradeLetterString = GradeCalculator.calculateLetterGrade(double.parse(gradeString.substring(0, gradeString.length - 1)));

    List<String> names = [];
    List<Assignment> assignments = courseData.marks?.marks?[0].getAssignments() ?? [];
    for (Assignment assignment in assignments) {
      names.add(assignment.type ?? "Assignment");
    }

    categoryListValues = names;
  }


  @override
  State<StatefulWidget> createState() => CourseViewState();
}

class CourseViewState extends State<CourseView> {
  String calculate(String? calculatedScoreRaw) {
    double parsed = double.parse(calculatedScoreRaw!);
    return parsed <= 4 && parsed != 0 ? "$parsed / 4" : "$parsed%";
  }

  List<String> getCategoryNames() {
    List<String> names = [];

    List<AssignmentGradeCalc> categories = widget.courseData.marks?.marks?[0].gradeCalculationSummary?.assignmentGradeCalcs ?? [];
    for (AssignmentGradeCalc category in categories) {
      if (category.type != "TOTAL") {
        names.add(category.type ?? "Assignment");
      }
    }

    return names;
  }

  @override
  Widget build(BuildContext context) {
    GradeCalculator gradeCalculator = GradeCalculator();

    return Scaffold(
        appBar: AppBar(
            title: Text(widget.courseData.title ?? "Undefined"),
            backgroundColor: Colors.green,
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
            iconTheme: const IconThemeData(color: Colors.white)),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 5),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: (() {
                    setState(() {
                      final gradeBook = GradeBook.fromXmlElement(xmlBackup.rootElement);
                      Synergy.populateScores(gradeBook);
                      List<Course> courses = gradeBook.courses?.courses ?? [];

                      //Find this course data
                      for (Course course in courses) {
                        if (course.title == widget.courseData.title) {
                          widget.courseData = course;
                          widget.gradeString = GradeCalculator.calculateGradeDisplay(widget.courseData.marks?.marks?[0] ?? Mark());
                          widget.gradeLetterString = GradeCalculator.calculateLetterGrade(double.parse(widget.gradeString.substring(0, widget.gradeString.length - 1)));
                          break;
                        }
                      }
                    });
                  }),
                  icon: const Icon(Icons.repeat)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(children: <Widget>[
                    Text(
                      widget.gradeLetterString ,
                      style: const TextStyle(fontSize: 81),
                    ),
                    Text(widget.gradeString
                      ,
                      style: const TextStyle(fontSize: 29),
                    )
                  ]))),
          TextButton(
              onPressed: () => {
                    setState(() {
                      widget.courseData.marks?.marks?[0].assignments?.assignments?.insert(
                              0,
                              Assignment(measure: "New Assignment", points: "0.00 / 0.00"));
                      if (getCategoryNames().isNotEmpty) {
                        widget.categoryListValues.insert(0, getCategoryNames()[0]);
                      } else {
                        widget.categoryListValues.insert(0, "Assignment");
                      }
                    })
                  },
              child: const Text("Add an assignment")),
          for (int i = 0; i < (widget.courseData.marks?.marks?[0].assignments?.assignments?.length ?? 0); i++)
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 0, bottom: 0, top: 0),
                child: Row(
                  children: [

                      Flexible(
                        flex: 3,
                        child: ListTile(
                          title: TextField(
                            controller: (() {
                              widget.courseData.marks?.marks?[0].assignments
                                  ?.assignments?[i].nameController.text = widget
                                      .courseData
                                      .marks
                                      ?.marks?[0]
                                      .assignments
                                      ?.assignments?[i]
                                      .measure ??
                                  "undefined";
                              return widget.courseData.marks?.marks?[0].assignments
                                  ?.assignments?[i].nameController;
                            })(),
                          decoration: null,
                        ),
                          subtitle: (() {
                            if (getCategoryNames().isEmpty) {
                              return const Text("Assignment", style: TextStyle(fontSize: 15, color: Colors.black54));
                            } else {
                              return DropdownButton<String>(
                                icon: const Icon(Icons.arrow_drop_down_rounded),
                                style: const TextStyle(fontSize: 15, color: Colors.black54),
                                isDense: true,
                                underline: DropdownButtonHideUnderline(child: Container()),
                                value: widget.categoryListValues[i],
                                items: getCategoryNames().map<
                                    DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value)
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    widget.categoryListValues[i] = value!; //Update the visual
                                    widget.courseData.marks?.marks?[0].assignments?.assignments?[i].type = value;
                                    widget.gradeString = GradeCalculator.calculateGradeDisplay(widget.courseData.marks?.marks?[0] ?? Mark());
                                    widget.gradeLetterString =  GradeCalculator.calculateLetterGrade(double.parse(widget.gradeString.substring(0, widget.gradeString.length - 1)));
                                  });
                                },
                              );
                            }
                          })(),
                      ),
                    ),
                    Flexible(
                        child: Row(children: [
                      Flexible(
                        child: TextField(
                            controller: (() {
                              widget
                                  .courseData
                                  .marks
                                  ?.marks?[0]
                                  .assignments
                                  ?.assignments?[i]
                                  .pointsEarnedController
                                  .text = widget.courseData.marks?.marks?[0]
                                      .assignments?.assignments?[i].pointsEarned
                                      .toString() ??
                                  "undefined";
                              return widget
                                  .courseData
                                  .marks
                                  ?.marks?[0]
                                  .assignments
                                  ?.assignments?[i]
                                  .pointsEarnedController;
                            })(),
                            decoration: null,
                            textAlign: TextAlign.end,
                            style: const TextStyle(fontSize: 15),
                            textInputAction: TextInputAction.go,
                            onSubmitted: (text) {
                              widget
                                  .courseData
                                  .marks
                                  ?.marks?[0]
                                  .assignments
                                  ?.assignments?[i]
                                  .pointsEarned = double.parse((widget
                                      .courseData
                                      .marks
                                      ?.marks?[0]
                                      .assignments
                                      ?.assignments?[i]
                                      .pointsEarnedController
                                      .text) ??
                                  "0.0");
                              setState(() {
                                widget.gradeString = GradeCalculator.calculateGradeDisplay(widget.courseData.marks?.marks?[0] ?? Mark());
                                widget.gradeLetterString = GradeCalculator.calculateLetterGrade(double.parse(widget.gradeString.substring(0, widget.gradeString.length - 1)));
                              });
                            }),
                      ),
                      const Text(
                        " / ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Flexible(
                        child: TextField(
                            controller: (() {
                              widget
                                  .courseData
                                  .marks
                                  ?.marks?[0]
                                  .assignments
                                  ?.assignments?[i]
                                  .pointsPossibleController
                                  .text = widget
                                      .courseData
                                      .marks
                                      ?.marks?[0]
                                      .assignments
                                      ?.assignments?[i]
                                      .pointsPossible
                                      .toString() ??
                                  "undefined";
                              return widget
                                  .courseData
                                  .marks
                                  ?.marks?[0]
                                  .assignments
                                  ?.assignments?[i]
                                  .pointsPossibleController;
                            })(),
                            decoration: null,
                            style: const TextStyle(fontSize: 15),
                            textInputAction: TextInputAction.go,
                            onSubmitted: (text) {
                              widget.courseData.marks?.marks?[0].assignments?.assignments?[i].pointsPossible = double.parse((widget.courseData.marks?.marks?[0].assignments?.assignments?[i].pointsPossibleController.text) ?? "0.0");
                              setState(() {
                                widget.gradeString = GradeCalculator.calculateGradeDisplay(widget.courseData.marks?.marks?[0] ?? Mark());
                                widget.gradeLetterString = GradeCalculator.calculateLetterGrade(double.parse(widget.gradeString.substring(0, widget.gradeString.length - 1)));
                              });
                            }),
                      )
                    ]))
                  ],
                ),
              ),
            )
        ]));
  }
}
