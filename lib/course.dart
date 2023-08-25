import 'dart:collection';
import 'dart:core';
import 'dart:core';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synapse/synapse.dart';

import 'Serialization/DeserializeXml.dart';

class CourseView extends StatefulWidget {
  final Course courseData;

  const CourseView({super.key, required this.courseData});

  @override
  State<StatefulWidget> createState() => CourseViewState();
}

class CourseViewState extends State<CourseView> {
  String calculate(String? calculatedScoreRaw) {
    double parsed = double.parse(calculatedScoreRaw!);
    return parsed <= 4 && parsed != 0 ? "$parsed / 4" : "$parsed%";
  }

  void recalculateOverallGrade(Course course) {
    List<Assignment>? assignments =
        course.marks?.marks?[0].assignments?.assignments;
    List<AssignmentGradeCalc>? weights =
        course.marks?.marks?[0].gradeCalculationSummary?.assignmentGradeCalcs;

    HashMap<String, double> weightTable = HashMap();
    HashMap<String, double> pointsTable = HashMap();
    for (int i = 0; i < (weights?.length ?? 0); i++) {
      String weightName = weights?[i].type ?? "Undefined";
      double weightPercent = double.parse(weights?[i]
              .weight
              ?.substring(0, (weights[i].weight?.length ?? 1) - 1) ??
          "0.0");

      weightTable.addAll({weightName: weightPercent});
      pointsTable.addAll({weightName: 0.0});
    }

    for (int i = 0; i < (assignments?.length ?? 0); i++) {
      double pointsEarned = assignments?[i].pointsEarned ?? 0;
      pointsTable[assignments?[i].type ?? "undefined"] =
          pointsTable[assignments?[i].type ?? "undefined"] ?? 0 + pointsEarned;
    }

    double totalPoints = 0.0;
    pointsTable.forEach((key, value) {
      double weight = (weightTable[key] ?? 1) / 100;
      totalPoints += value * weight;
    });

    double newCourseGrade = totalPoints;
    course.marks?.marks?[0].calculatedScoreRaw = "$newCourseGrade";
    print(newCourseGrade);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.courseData.title ?? "Undefined"),
            backgroundColor: Colors.green,
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
            iconTheme: const IconThemeData(color: Colors.white)),
        body: ListView(children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(children: <Widget>[
                    Text(
                      widget.courseData.marks?.marks?[0]
                              .calculatedScoreString ??
                          "Undefined",
                      style: const TextStyle(fontSize: 81),
                    ),
                    Text(
                      calculate(widget
                          .courseData.marks?.marks?[0].calculatedScoreRaw),
                      style: const TextStyle(fontSize: 29),
                    )
                  ]))),
          TextButton(
              onPressed: () => {
                    setState(() {
                      widget
                          .courseData.marks?.marks?[0].assignments?.assignments
                          ?.insert(
                              0,
                              Assignment(
                                  measure: "New Assignment",
                                  points: "0.00 / 0.00"));
                    })
                  },
              child: const Text("Add an assignment")),
          for (int i = 0;
              i <
                  (widget.courseData.marks?.marks?[0].assignments?.assignments
                      ?.length as int);
              i++)
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 15, top: 10),
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: TextField(
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
                            onChanged: (text) {
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
                              recalculateOverallGrade(widget.courseData);
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
                            onChanged: (text) {
                              widget
                                  .courseData
                                  .marks
                                  ?.marks?[0]
                                  .assignments
                                  ?.assignments?[i]
                                  .pointsPossible = double.parse((widget
                                      .courseData
                                      .marks
                                      ?.marks?[0]
                                      .assignments
                                      ?.assignments?[i]
                                      .pointsPossibleController
                                      .text) ??
                                  "0.0");
                              recalculateOverallGrade(widget.courseData);
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
