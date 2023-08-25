import 'package:flutter/cupertino.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;
import 'package:xml/xml.dart';

part 'DeserializeXml.g.dart';

@annotation.XmlRootElement(name: "GradeBook")
@annotation.XmlSerializable()
class GradeBook {
  @annotation.XmlElement(name: "ReportingPeriods")
  ReportingPeriods? reportingPeriods;
  @annotation.XmlElement(name: "ReportingPeriod")
  ReportingPeriod? reportingPeriod;
  @annotation.XmlElement(name: "Courses")
  Courses? courses;

  GradeBook({this.reportingPeriods, this.reportingPeriod, this.courses});

  @override
  String toString() {
    return 'GradeBook {'
        '\n Reporting Periods: $reportingPeriods'
        '\n Reporting Period: $reportingPeriod'
        '\n Courses: $courses'
        '\n}';
  }

  factory GradeBook.fromXmlElement(XmlElement element) =>
      _$GradeBookFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$GradeBookBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$GradeBookBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$GradeBookToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$GradeBookToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$GradeBookToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: "ReportingPeriods")
@annotation.XmlSerializable()
class ReportingPeriods {
  @annotation.XmlElement(name: "ReportPeriod")
  List<ReportPeriod>? reportingPeriods;

  ReportingPeriods({this.reportingPeriods});

  @override
  String toString() {
    return "\n  Reporting Periods: $reportingPeriods";
  }

  factory ReportingPeriods.fromXmlElement(XmlElement element) =>
      _$ReportingPeriodsFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ReportingPeriodsBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ReportingPeriodsBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ReportingPeriodsToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ReportingPeriodsToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ReportingPeriodsToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: "ReportPeriod")
@annotation.XmlSerializable()
class ReportPeriod {
  @annotation.XmlAttribute(name: "Index")
  String? index;
  @annotation.XmlAttribute(name: "GradePeriod")
  String? gradePeriod;
  @annotation.XmlAttribute(name: "StartDate")
  String? startDate;
  @annotation.XmlAttribute(name: "EndDate")
  String? endDate;

  ReportPeriod({this.index, this.gradePeriod, this.startDate, this.endDate});

  @override
  String toString() {
    return "Report Period {"
        "\n  Index: $index"
        "\n  GradePeriod: $gradePeriod"
        "\n  StartDate: $startDate"
        "\n  EndDate: $endDate"
        "\n}";
  }

  factory ReportPeriod.fromXmlElement(XmlElement element) =>
      _$ReportPeriodFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ReportPeriodBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ReportPeriodBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ReportPeriodToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ReportPeriodToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ReportPeriodToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: "ReportingPeriod")
@annotation.XmlSerializable()
class ReportingPeriod {
  @annotation.XmlAttribute(name: "GradePeriod")
  String? gradePeriod;
  @annotation.XmlAttribute(name: "StartDate")
  String? startDate;
  @annotation.XmlAttribute(name: "EndDate")
  String? endDate;

  ReportingPeriod({this.gradePeriod, this.startDate, this.endDate});

  @override
  String toString() {
    return "ReportingPeriod {"
        "\n  GradePeriod: $gradePeriod"
        "\n  StartDate: $startDate"
        "\n  EndDate: $endDate"
        "\n}";
  }

  factory ReportingPeriod.fromXmlElement(XmlElement element) =>
      _$ReportingPeriodFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ReportingPeriodBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$ReportingPeriodBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ReportingPeriodToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ReportingPeriodToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$ReportingPeriodToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: "Courses")
@annotation.XmlSerializable()
class Courses {
  @annotation.XmlElement(name: "Course")
  List<Course>? courses;

  Courses({this.courses});

  @override
  String toString() {
    return "\n  Courses: $courses";
  }

  factory Courses.fromXmlElement(XmlElement element) =>
      _$CoursesFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$CoursesBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$CoursesBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$CoursesToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$CoursesToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$CoursesToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: 'Course')
@annotation.XmlSerializable()
class Course {
  @annotation.XmlAttribute(name: "UseRichContent")
  bool? useRichContent;
  @annotation.XmlAttribute(name: "Period")
  String? period;
  @annotation.XmlAttribute(name: "Title")
  String? title;
  @annotation.XmlAttribute(name: "Room")
  String? room;
  @annotation.XmlAttribute(name: "Staff")
  String? staff;
  @annotation.XmlAttribute(name: "StaffEMail")
  String? staffEMail;
  @annotation.XmlAttribute(name: "StaffGU")
  String? staffGU;
  @annotation.XmlAttribute(name: "HighlightPercentageCutOffForProgressBar")
  String? highlightPercentageCutOffForProgressBar;
  @annotation.XmlElement(name: "Marks")
  Marks? marks;

  Course(
      {this.useRichContent,
      this.period,
      this.title,
      this.room,
      this.staff,
      this.staffEMail,
      this.staffGU,
      this.highlightPercentageCutOffForProgressBar,
      this.marks});

  @override
  String toString() {
    return "Course {"
        "\n  UseRichContent: $useRichContent"
        "\n  Period: $period"
        "\n  Title: $title"
        "\n  Room: $room"
        "\n  Staff: $staff"
        "\n  StaffEmail: $staffEMail"
        "\n  StaffGU: $staffGU"
        "\n  HighlightPercentageCutOffForProgressBar: $highlightPercentageCutOffForProgressBar"
        "\n  Marks: $marks"
        "\n}";
  }

  factory Course.fromXmlElement(XmlElement element) =>
      _$CourseFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$CourseBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$CourseBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$CourseToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$CourseToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$CourseToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: 'Marks')
@annotation.XmlSerializable()
class Marks {
  @annotation.XmlElement(name: "Mark")
  List<Mark>? marks;

  Marks({
    this.marks,
  });

  @override
  String toString() {
    return "\n  Marks: $marks";
  }

  factory Marks.fromXmlElement(XmlElement element) =>
      _$MarksFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$MarksBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$MarksBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$MarksToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$MarksToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$MarksToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: 'Mark')
@annotation.XmlSerializable()
class Mark {
  @annotation.XmlAttribute(name: "MarkName")
  String? markName;
  @annotation.XmlAttribute(name: "CalculatedScoreString")
  String? calculatedScoreString;
  @annotation.XmlAttribute(name: "CalculatedScoreRaw")
  String? calculatedScoreRaw;
  @annotation.XmlElement(name: "GradeCalculationSummary")
  GradeCalculationSummary? gradeCalculationSummary;
  @annotation.XmlElement(name: "Assignments")
  Assignments? assignments;

  Mark(
      {this.markName,
      this.calculatedScoreString,
      this.calculatedScoreRaw,
      this.gradeCalculationSummary,
      this.assignments});

  @override
  String toString() {
    return "  Mark {"
        "\n  MarkName: $markName"
        "\n  CalculatedScoreString: $calculatedScoreString"
        "\n  CalculatedScoreRaw: $calculatedScoreRaw"
        "\n  Assignments: $assignments"
        "\n}";
  }

  factory Mark.fromXmlElement(XmlElement element) =>
      _$MarkFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$MarkBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$MarkBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$MarkToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$MarkToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$MarkToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: 'GradeCalculationSummary')
@annotation.XmlSerializable()
class GradeCalculationSummary {
  @annotation.XmlElement(name: 'AssignmentGradeCalc')
  List<AssignmentGradeCalc>? assignmentGradeCalcs;

  GradeCalculationSummary({
    this.assignmentGradeCalcs,
  });

  @override
  String toString() {
    return "  GradeCalculationSummary {"
        "\n  AssignmentGradeCalcs: $assignmentGradeCalcs"
        "\n  }";
  }

  factory GradeCalculationSummary.fromXmlElement(XmlElement element) =>
      _$GradeCalculationSummaryFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$GradeCalculationSummaryBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$GradeCalculationSummaryBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$GradeCalculationSummaryToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$GradeCalculationSummaryToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$GradeCalculationSummaryToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: 'AssignmentGradeCalc')
@annotation.XmlSerializable()
class AssignmentGradeCalc {
  @annotation.XmlAttribute(name: 'Type')
  String? type;
  @annotation.XmlAttribute(name: 'Weight')
  String? weight;
  @annotation.XmlAttribute(name: 'Points')
  String? points;
  @annotation.XmlAttribute(name: 'PointsPossible')
  String? pointsPossible;
  @annotation.XmlAttribute(name: 'WeightedPct')
  String? weightedPct;
  @annotation.XmlAttribute(name: 'CalculatedMark')
  String? calculatedMark;

  AssignmentGradeCalc(
      {this.type,
      this.weight,
      this.points,
      this.pointsPossible,
      this.weightedPct,
      this.calculatedMark});

  @override
  String toString() {
    return "  AssignmentGradeCalc {"
        "\n  Type: $type"
        "\n  Weight: $weight"
        "\n  Points: $points"
        "\n  PointsPossible: $pointsPossible"
        "\n  WeightedPct: $weightedPct"
        "\n  CalculatedMark: $calculatedMark"
        "\n  }";
  }

  factory AssignmentGradeCalc.fromXmlElement(XmlElement element) =>
      _$AssignmentGradeCalcFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$AssignmentGradeCalcBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$AssignmentGradeCalcBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$AssignmentGradeCalcToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$AssignmentGradeCalcToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$AssignmentGradeCalcToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: 'Assignments')
@annotation.XmlSerializable()
class Assignments {
  @annotation.XmlElement(name: 'Assignment')
  List<Assignment>? assignments;

  Assignments({this.assignments});

  @override
  String toString() {
    return "Assignments: $assignments";
  }

  factory Assignments.fromXmlElement(XmlElement element) =>
      _$AssignmentsFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$AssignmentsBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$AssignmentsBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$AssignmentsToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$AssignmentsToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$AssignmentsToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: 'Assignment')
@annotation.XmlSerializable()
class Assignment {
  @annotation.XmlAttribute(name: 'GradebookID')
  String? gradeBookID;
  @annotation.XmlAttribute(name: 'Measure')
  String? measure;
  @annotation.XmlAttribute(name: 'Type')
  String? type;
  @annotation.XmlAttribute(name: 'Date')
  String? date;
  @annotation.XmlAttribute(name: 'DueDate')
  String? dueDate;
  @annotation.XmlAttribute(name: 'Score')
  String? score;
  @annotation.XmlAttribute(name: 'ScoreType')
  String? scoreType;
  @annotation.XmlAttribute(name: 'Points')
  String? points;
  @annotation.XmlAttribute(name: 'Notes')
  String? notes;
  @annotation.XmlAttribute(name: 'TeacherID')
  String? teacherID;
  @annotation.XmlAttribute(name: 'StudentID')
  String? studentID;
  @annotation.XmlAttribute(name: 'MeasureDescription')
  String? measureDescription;
  @annotation.XmlAttribute(name: 'HasDropBox')
  String? hasDropBox;
  @annotation.XmlAttribute(name: 'DropStartDate')
  String? dropStartDate;
  @annotation.XmlAttribute(name: 'DropEndDate')
  String? dropEndDate;

  bool isBeingEdited = false;
  double pointsEarned = 0;
  double pointsPossible = 0;
  TextEditingController pointsEarnedController = TextEditingController();
  TextEditingController pointsPossibleController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Assignment(
      {this.gradeBookID,
      this.measure,
      this.type,
      this.date,
      this.dueDate,
      this.score,
      this.scoreType,
      this.points,
      this.notes,
      this.teacherID,
      this.studentID,
      this.measureDescription,
      this.hasDropBox,
      this.dropStartDate,
      this.dropEndDate});

  @override
  String toString() {
    return "Assignment {"
        "\n  GradeBookID: $gradeBookID"
        "\n  Measure: $measure"
        "\n  Type: $type"
        "\n  Date: $date"
        "\n  DueDate: $dueDate"
        "\n  Score: $score"
        "\n  ScoreType: $scoreType"
        "\n  Points: $points"
        "\n  Notes: $notes"
        "\n  TeacherID: $teacherID"
        "\n  StudentID: $studentID"
        "\n  MeasureDescription: $measureDescription"
        "\n  HasDropBox: $hasDropBox"
        "\n  DropStartDate: $dropStartDate"
        "\n  DropEndDate: $dropEndDate"
        "}";
  }

  factory Assignment.fromXmlElement(XmlElement element) =>
      _$AssignmentFromXmlElement(element);

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$AssignmentBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$AssignmentBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$AssignmentToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$AssignmentToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$AssignmentToXmlElement(
        this,
        namespaces: namespaces,
      );
}
