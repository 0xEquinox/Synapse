import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synapse/synapse.dart';

import 'Serialization/DeserializeXml.dart';

class CourseView extends StatefulWidget {
  final Course courseData;

  const CourseView({
    super.key,
    required this.courseData
  });

  @override
  State<StatefulWidget> createState() => CourseViewState();
}

class CourseViewState extends State<CourseView> {
  String calculate(String? calculatedScoreRaw) {
    double parsed = double.parse(calculatedScoreRaw!);
    return parsed <= 4 && parsed != 0 ? "$parsed / 4" : "$parsed%";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text(widget.courseData.title ?? "Undefined"),
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24 ),
      ),
      body: ListView (
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Align (
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget> [
                  Text(
                    widget.courseData.marks?.marks?[0].calculatedScoreString ?? "Undefined",
                    style: const TextStyle(fontSize: 81),
                  ),
                  Text(
                    calculate(widget.courseData.marks?.marks?[0].calculatedScoreRaw),
                    style: const TextStyle(fontSize: 29),
                  )
                ]
              )
            )
          ),
          TextButton(
              onPressed: () => {
                setState(() {
                  widget.courseData.marks?.marks?[0].assignments?.assignments?.insert(0, Assignment(measure: "New Assignment", score: "0 out of 0.0000"));
                })
              },
              child: const Text("Add an assingment")
          ),
          for (int i = 0; i < (widget.courseData.marks?.marks?[0].assignments?.assignments?.length as int); i++)
            Draggable(
              feedback: Card(
                child: ListTile(
                  title: Text(widget.courseData.marks?.marks?[0].assignments?.assignments?[i].measure ?? "Undefined"),
                  trailing: Text(widget.courseData.marks?.marks?[0].assignments?.assignments?[i].score ?? "Undefined"),
                ),
              ),
              child: Card(
                  child: ListTile(
                    title: Text(widget.courseData.marks?.marks?[0].assignments?.assignments?[i].measure ?? "Undefined"),
                    trailing: Text(widget.courseData.marks?.marks?[0].assignments?.assignments?[i].score ?? "Undefined"),
                  ),
                )
            )
        ]
      )
    );
  }
}