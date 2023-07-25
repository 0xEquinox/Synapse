import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synapse/Login.dart';
import 'package:synapse/Serialization/DeserializeXml.dart';

import 'course.dart';

class GradeViewPage extends StatefulWidget {
  const GradeViewPage({super.key, required this.title, required this.gradeBookData});
  final String title;
  final GradeBook gradeBookData;

  @override
  State<GradeViewPage> createState() => _GradeViewPageState();

}

class _GradeViewPageState extends State<GradeViewPage> {
  getClasses(GradeBook gradeBookData) {
    List<Course>? courses = gradeBookData.courses?.courses;
    if (courses == null) return null;

    return courses;
  }

  String calculate(String? calculatedScoreRaw) {
    double parsed = double.parse(calculatedScoreRaw!);
    return parsed <= 4 && parsed != 0 ? "$parsed / 4" : "$parsed%";
  }

  @override
  Widget build(BuildContext context) {
    List<Course> courses = getClasses(widget.gradeBookData);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children:  <Widget> [
            for (int index = 0; index < courses.length; index++)
              GestureDetector(
                child: Card(
                  child: ListTile(
                    title: Text(courses[index].title ?? 'Undefined'),
                    subtitle: Text(courses[index].staff ?? 'Undefined'),
                    trailing: Text(
                      calculate(courses[index].marks?.marks?[0].calculatedScoreRaw),
                      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18)
                    ),
                  ),
                ),
                onTap: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CourseView(courseData: courses[index])
                    )
                  )
                },
              ),
          ],
        ),
      ),
    );
  }
}