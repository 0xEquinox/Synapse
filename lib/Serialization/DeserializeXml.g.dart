// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeserializeXml.dart';

// **************************************************************************
// XmlSerializableGenerator
// **************************************************************************

void _$GradeBookBuildXmlChildren(GradeBook instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final reportingPeriods = instance.reportingPeriods;
  final reportingPeriodsSerialized = reportingPeriods;
  builder.element('ReportingPeriods', nest: () {
    if (reportingPeriodsSerialized != null) {
      reportingPeriodsSerialized.buildXmlChildren(builder,
          namespaces: namespaces);
    }
  });
  final reportingPeriod = instance.reportingPeriod;
  final reportingPeriodSerialized = reportingPeriod;
  builder.element('ReportingPeriod', nest: () {
    if (reportingPeriodSerialized != null) {
      reportingPeriodSerialized.buildXmlChildren(builder,
          namespaces: namespaces);
    }
  });
  final courses = instance.courses;
  final coursesSerialized = courses;
  builder.element('Courses', nest: () {
    if (coursesSerialized != null) {
      coursesSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
}

void _$GradeBookBuildXmlElement(GradeBook instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('GradeBook', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

GradeBook _$GradeBookFromXmlElement(XmlElement element) {
  final reportingPeriods = element.getElement('ReportingPeriods');
  final reportingPeriod = element.getElement('ReportingPeriod');
  final courses = element.getElement('Courses');
  return GradeBook(
      reportingPeriods: reportingPeriods != null
          ? ReportingPeriods.fromXmlElement(reportingPeriods)
          : null,
      reportingPeriod: reportingPeriod != null
          ? ReportingPeriod.fromXmlElement(reportingPeriod)
          : null,
      courses: courses != null ? Courses.fromXmlElement(courses) : null);
}

List<XmlAttribute> _$GradeBookToXmlAttributes(GradeBook instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$GradeBookToXmlChildren(GradeBook instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final reportingPeriods = instance.reportingPeriods;
  final reportingPeriodsSerialized = reportingPeriods;
  final reportingPeriodsConstructed = XmlElement(
      XmlName('ReportingPeriods'),
      reportingPeriodsSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      reportingPeriodsSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(reportingPeriodsConstructed);
  final reportingPeriod = instance.reportingPeriod;
  final reportingPeriodSerialized = reportingPeriod;
  final reportingPeriodConstructed = XmlElement(
      XmlName('ReportingPeriod'),
      reportingPeriodSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      reportingPeriodSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(reportingPeriodConstructed);
  final courses = instance.courses;
  final coursesSerialized = courses;
  final coursesConstructed = XmlElement(
      XmlName('Courses'),
      coursesSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      coursesSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(coursesConstructed);
  return children;
}

XmlElement _$GradeBookToXmlElement(GradeBook instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('GradeBook'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ReportingPeriodsBuildXmlChildren(
    ReportingPeriods instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final reportingPeriods = instance.reportingPeriods;
  final reportingPeriodsSerialized = reportingPeriods;
  if (reportingPeriodsSerialized != null) {
    for (final value in reportingPeriodsSerialized) {
      builder.element('ReportPeriod', nest: () {
        value.buildXmlChildren(builder, namespaces: namespaces);
      });
    }
  }
}

void _$ReportingPeriodsBuildXmlElement(
    ReportingPeriods instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('ReportingPeriods', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ReportingPeriods _$ReportingPeriodsFromXmlElement(XmlElement element) {
  final reportingPeriods = element.getElements('ReportPeriod');
  return ReportingPeriods(
      reportingPeriods: reportingPeriods
          ?.map((e) => ReportPeriod.fromXmlElement(e))
          .toList());
}

List<XmlAttribute> _$ReportingPeriodsToXmlAttributes(ReportingPeriods instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ReportingPeriodsToXmlChildren(ReportingPeriods instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final reportingPeriods = instance.reportingPeriods;
  final reportingPeriodsSerialized = reportingPeriods;
  final reportingPeriodsConstructed = reportingPeriodsSerialized?.map((e) =>
      XmlElement(
          XmlName('ReportPeriod'),
          e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  if (reportingPeriodsConstructed != null) {
    children.addAll(reportingPeriodsConstructed);
  }
  return children;
}

XmlElement _$ReportingPeriodsToXmlElement(ReportingPeriods instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('ReportingPeriods'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ReportPeriodBuildXmlChildren(ReportPeriod instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final index = instance.index;
  final indexSerialized = index;
  if (indexSerialized != null) {
    builder.attribute('Index', indexSerialized);
  }
  final gradePeriod = instance.gradePeriod;
  final gradePeriodSerialized = gradePeriod;
  if (gradePeriodSerialized != null) {
    builder.attribute('GradePeriod', gradePeriodSerialized);
  }
  final startDate = instance.startDate;
  final startDateSerialized = startDate;
  if (startDateSerialized != null) {
    builder.attribute('StartDate', startDateSerialized);
  }
  final endDate = instance.endDate;
  final endDateSerialized = endDate;
  if (endDateSerialized != null) {
    builder.attribute('EndDate', endDateSerialized);
  }
}

void _$ReportPeriodBuildXmlElement(ReportPeriod instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('ReportPeriod', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ReportPeriod _$ReportPeriodFromXmlElement(XmlElement element) {
  final index = element.getAttribute('Index');
  final gradePeriod = element.getAttribute('GradePeriod');
  final startDate = element.getAttribute('StartDate');
  final endDate = element.getAttribute('EndDate');
  return ReportPeriod(
      index: index,
      gradePeriod: gradePeriod,
      startDate: startDate,
      endDate: endDate);
}

List<XmlAttribute> _$ReportPeriodToXmlAttributes(ReportPeriod instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final index = instance.index;
  final indexSerialized = index;
  final indexConstructed = indexSerialized != null
      ? XmlAttribute(XmlName('Index'), indexSerialized)
      : null;
  if (indexConstructed != null) {
    attributes.add(indexConstructed);
  }
  final gradePeriod = instance.gradePeriod;
  final gradePeriodSerialized = gradePeriod;
  final gradePeriodConstructed = gradePeriodSerialized != null
      ? XmlAttribute(XmlName('GradePeriod'), gradePeriodSerialized)
      : null;
  if (gradePeriodConstructed != null) {
    attributes.add(gradePeriodConstructed);
  }
  final startDate = instance.startDate;
  final startDateSerialized = startDate;
  final startDateConstructed = startDateSerialized != null
      ? XmlAttribute(XmlName('StartDate'), startDateSerialized)
      : null;
  if (startDateConstructed != null) {
    attributes.add(startDateConstructed);
  }
  final endDate = instance.endDate;
  final endDateSerialized = endDate;
  final endDateConstructed = endDateSerialized != null
      ? XmlAttribute(XmlName('EndDate'), endDateSerialized)
      : null;
  if (endDateConstructed != null) {
    attributes.add(endDateConstructed);
  }
  return attributes;
}

List<XmlNode> _$ReportPeriodToXmlChildren(ReportPeriod instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$ReportPeriodToXmlElement(ReportPeriod instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('ReportPeriod'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$ReportingPeriodBuildXmlChildren(
    ReportingPeriod instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final gradePeriod = instance.gradePeriod;
  final gradePeriodSerialized = gradePeriod;
  if (gradePeriodSerialized != null) {
    builder.attribute('GradePeriod', gradePeriodSerialized);
  }
  final startDate = instance.startDate;
  final startDateSerialized = startDate;
  if (startDateSerialized != null) {
    builder.attribute('StartDate', startDateSerialized);
  }
  final endDate = instance.endDate;
  final endDateSerialized = endDate;
  if (endDateSerialized != null) {
    builder.attribute('EndDate', endDateSerialized);
  }
}

void _$ReportingPeriodBuildXmlElement(
    ReportingPeriod instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('ReportingPeriod', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ReportingPeriod _$ReportingPeriodFromXmlElement(XmlElement element) {
  final gradePeriod = element.getAttribute('GradePeriod');
  final startDate = element.getAttribute('StartDate');
  final endDate = element.getAttribute('EndDate');
  return ReportingPeriod(
      gradePeriod: gradePeriod, startDate: startDate, endDate: endDate);
}

List<XmlAttribute> _$ReportingPeriodToXmlAttributes(ReportingPeriod instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final gradePeriod = instance.gradePeriod;
  final gradePeriodSerialized = gradePeriod;
  final gradePeriodConstructed = gradePeriodSerialized != null
      ? XmlAttribute(XmlName('GradePeriod'), gradePeriodSerialized)
      : null;
  if (gradePeriodConstructed != null) {
    attributes.add(gradePeriodConstructed);
  }
  final startDate = instance.startDate;
  final startDateSerialized = startDate;
  final startDateConstructed = startDateSerialized != null
      ? XmlAttribute(XmlName('StartDate'), startDateSerialized)
      : null;
  if (startDateConstructed != null) {
    attributes.add(startDateConstructed);
  }
  final endDate = instance.endDate;
  final endDateSerialized = endDate;
  final endDateConstructed = endDateSerialized != null
      ? XmlAttribute(XmlName('EndDate'), endDateSerialized)
      : null;
  if (endDateConstructed != null) {
    attributes.add(endDateConstructed);
  }
  return attributes;
}

List<XmlNode> _$ReportingPeriodToXmlChildren(ReportingPeriod instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$ReportingPeriodToXmlElement(ReportingPeriod instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('ReportingPeriod'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$CoursesBuildXmlChildren(Courses instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final courses = instance.courses;
  final coursesSerialized = courses;
  if (coursesSerialized != null) {
    for (final value in coursesSerialized) {
      builder.element('Course', nest: () {
        value.buildXmlChildren(builder, namespaces: namespaces);
      });
    }
  }
}

void _$CoursesBuildXmlElement(Courses instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Courses', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Courses _$CoursesFromXmlElement(XmlElement element) {
  final courses = element.getElements('Course');
  return Courses(
      courses: courses?.map((e) => Course.fromXmlElement(e)).toList());
}

List<XmlAttribute> _$CoursesToXmlAttributes(Courses instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$CoursesToXmlChildren(Courses instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final courses = instance.courses;
  final coursesSerialized = courses;
  final coursesConstructed = coursesSerialized?.map((e) => XmlElement(
      XmlName('Course'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  if (coursesConstructed != null) {
    children.addAll(coursesConstructed);
  }
  return children;
}

XmlElement _$CoursesToXmlElement(Courses instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Courses'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$CourseBuildXmlChildren(Course instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final useRichContent = instance.useRichContent;
  final useRichContentSerialized = useRichContent != null
      ? useRichContent == true
          ? 'true'
          : 'false'
      : null;
  if (useRichContentSerialized != null) {
    builder.attribute('UseRichContent', useRichContentSerialized);
  }
  final period = instance.period;
  final periodSerialized = period;
  if (periodSerialized != null) {
    builder.attribute('Period', periodSerialized);
  }
  final title = instance.title;
  final titleSerialized = title;
  if (titleSerialized != null) {
    builder.attribute('Title', titleSerialized);
  }
  final room = instance.room;
  final roomSerialized = room;
  if (roomSerialized != null) {
    builder.attribute('Room', roomSerialized);
  }
  final staff = instance.staff;
  final staffSerialized = staff;
  if (staffSerialized != null) {
    builder.attribute('Staff', staffSerialized);
  }
  final staffEMail = instance.staffEMail;
  final staffEMailSerialized = staffEMail;
  if (staffEMailSerialized != null) {
    builder.attribute('StaffEMail', staffEMailSerialized);
  }
  final staffGU = instance.staffGU;
  final staffGUSerialized = staffGU;
  if (staffGUSerialized != null) {
    builder.attribute('StaffGU', staffGUSerialized);
  }
  final highlightPercentageCutOffForProgressBar =
      instance.highlightPercentageCutOffForProgressBar;
  final highlightPercentageCutOffForProgressBarSerialized =
      highlightPercentageCutOffForProgressBar;
  if (highlightPercentageCutOffForProgressBarSerialized != null) {
    builder.attribute('HighlightPercentageCutOffForProgressBar',
        highlightPercentageCutOffForProgressBarSerialized);
  }
  final marks = instance.marks;
  final marksSerialized = marks;
  builder.element('Marks', nest: () {
    if (marksSerialized != null) {
      marksSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
}

void _$CourseBuildXmlElement(Course instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Course', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Course _$CourseFromXmlElement(XmlElement element) {
  final useRichContent = element.getAttribute('UseRichContent');
  final period = element.getAttribute('Period');
  final title = element.getAttribute('Title');
  final room = element.getAttribute('Room');
  final staff = element.getAttribute('Staff');
  final staffEMail = element.getAttribute('StaffEMail');
  final staffGU = element.getAttribute('StaffGU');
  final highlightPercentageCutOffForProgressBar =
      element.getAttribute('HighlightPercentageCutOffForProgressBar');
  final marks = element.getElement('Marks');
  return Course(
      useRichContent: useRichContent != null
          ? useRichContent == 'true' || useRichContent == '1'
              ? true
              : useRichContent == 'false' || useRichContent == '0'
                  ? false
                  : throw FormatException('Invalid bool format', useRichContent)
          : null,
      period: period,
      title: title,
      room: room,
      staff: staff,
      staffEMail: staffEMail,
      staffGU: staffGU,
      highlightPercentageCutOffForProgressBar:
          highlightPercentageCutOffForProgressBar,
      marks: marks != null ? Marks.fromXmlElement(marks) : null);
}

List<XmlAttribute> _$CourseToXmlAttributes(Course instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final useRichContent = instance.useRichContent;
  final useRichContentSerialized = useRichContent != null
      ? useRichContent == true
          ? 'true'
          : 'false'
      : null;
  final useRichContentConstructed = useRichContentSerialized != null
      ? XmlAttribute(XmlName('UseRichContent'), useRichContentSerialized)
      : null;
  if (useRichContentConstructed != null) {
    attributes.add(useRichContentConstructed);
  }
  final period = instance.period;
  final periodSerialized = period;
  final periodConstructed = periodSerialized != null
      ? XmlAttribute(XmlName('Period'), periodSerialized)
      : null;
  if (periodConstructed != null) {
    attributes.add(periodConstructed);
  }
  final title = instance.title;
  final titleSerialized = title;
  final titleConstructed = titleSerialized != null
      ? XmlAttribute(XmlName('Title'), titleSerialized)
      : null;
  if (titleConstructed != null) {
    attributes.add(titleConstructed);
  }
  final room = instance.room;
  final roomSerialized = room;
  final roomConstructed = roomSerialized != null
      ? XmlAttribute(XmlName('Room'), roomSerialized)
      : null;
  if (roomConstructed != null) {
    attributes.add(roomConstructed);
  }
  final staff = instance.staff;
  final staffSerialized = staff;
  final staffConstructed = staffSerialized != null
      ? XmlAttribute(XmlName('Staff'), staffSerialized)
      : null;
  if (staffConstructed != null) {
    attributes.add(staffConstructed);
  }
  final staffEMail = instance.staffEMail;
  final staffEMailSerialized = staffEMail;
  final staffEMailConstructed = staffEMailSerialized != null
      ? XmlAttribute(XmlName('StaffEMail'), staffEMailSerialized)
      : null;
  if (staffEMailConstructed != null) {
    attributes.add(staffEMailConstructed);
  }
  final staffGU = instance.staffGU;
  final staffGUSerialized = staffGU;
  final staffGUConstructed = staffGUSerialized != null
      ? XmlAttribute(XmlName('StaffGU'), staffGUSerialized)
      : null;
  if (staffGUConstructed != null) {
    attributes.add(staffGUConstructed);
  }
  final highlightPercentageCutOffForProgressBar =
      instance.highlightPercentageCutOffForProgressBar;
  final highlightPercentageCutOffForProgressBarSerialized =
      highlightPercentageCutOffForProgressBar;
  final highlightPercentageCutOffForProgressBarConstructed =
      highlightPercentageCutOffForProgressBarSerialized != null
          ? XmlAttribute(XmlName('HighlightPercentageCutOffForProgressBar'),
              highlightPercentageCutOffForProgressBarSerialized)
          : null;
  if (highlightPercentageCutOffForProgressBarConstructed != null) {
    attributes.add(highlightPercentageCutOffForProgressBarConstructed);
  }
  return attributes;
}

List<XmlNode> _$CourseToXmlChildren(Course instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final marks = instance.marks;
  final marksSerialized = marks;
  final marksConstructed = XmlElement(
      XmlName('Marks'),
      marksSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      marksSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(marksConstructed);
  return children;
}

XmlElement _$CourseToXmlElement(Course instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Course'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$MarksBuildXmlChildren(Marks instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final marks = instance.marks;
  final marksSerialized = marks;
  if (marksSerialized != null) {
    for (final value in marksSerialized) {
      builder.element('Mark', nest: () {
        value.buildXmlChildren(builder, namespaces: namespaces);
      });
    }
  }
}

void _$MarksBuildXmlElement(Marks instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Marks', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Marks _$MarksFromXmlElement(XmlElement element) {
  final marks = element.getElements('Mark');
  return Marks(marks: marks?.map((e) => Mark.fromXmlElement(e)).toList());
}

List<XmlAttribute> _$MarksToXmlAttributes(Marks instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$MarksToXmlChildren(Marks instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final marks = instance.marks;
  final marksSerialized = marks;
  final marksConstructed = marksSerialized?.map((e) => XmlElement(
      XmlName('Mark'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  if (marksConstructed != null) {
    children.addAll(marksConstructed);
  }
  return children;
}

XmlElement _$MarksToXmlElement(Marks instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Marks'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$MarkBuildXmlChildren(Mark instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final markName = instance.markName;
  final markNameSerialized = markName;
  if (markNameSerialized != null) {
    builder.attribute('MarkName', markNameSerialized);
  }
  final calculatedScoreString = instance.calculatedScoreString;
  final calculatedScoreStringSerialized = calculatedScoreString;
  if (calculatedScoreStringSerialized != null) {
    builder.attribute('CalculatedScoreString', calculatedScoreStringSerialized);
  }
  final calculatedScoreRaw = instance.calculatedScoreRaw;
  final calculatedScoreRawSerialized = calculatedScoreRaw;
  if (calculatedScoreRawSerialized != null) {
    builder.attribute('CalculatedScoreRaw', calculatedScoreRawSerialized);
  }
  final gradeCalculationSummary = instance.gradeCalculationSummary;
  final gradeCalculationSummarySerialized = gradeCalculationSummary;
  builder.element('GradeCalculationSummary', nest: () {
    if (gradeCalculationSummarySerialized != null) {
      gradeCalculationSummarySerialized.buildXmlChildren(builder,
          namespaces: namespaces);
    }
  });
  final assignments = instance.assignments;
  final assignmentsSerialized = assignments;
  builder.element('Assignments', nest: () {
    if (assignmentsSerialized != null) {
      assignmentsSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
}

void _$MarkBuildXmlElement(Mark instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Mark', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Mark _$MarkFromXmlElement(XmlElement element) {
  final markName = element.getAttribute('MarkName');
  final calculatedScoreString = element.getAttribute('CalculatedScoreString');
  final calculatedScoreRaw = element.getAttribute('CalculatedScoreRaw');
  final gradeCalculationSummary = element.getElement('GradeCalculationSummary');
  final assignments = element.getElement('Assignments');
  return Mark(
      markName: markName,
      calculatedScoreString: calculatedScoreString,
      calculatedScoreRaw: calculatedScoreRaw,
      gradeCalculationSummary: gradeCalculationSummary != null
          ? GradeCalculationSummary.fromXmlElement(gradeCalculationSummary)
          : null,
      assignments:
          assignments != null ? Assignments.fromXmlElement(assignments) : null);
}

List<XmlAttribute> _$MarkToXmlAttributes(Mark instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final markName = instance.markName;
  final markNameSerialized = markName;
  final markNameConstructed = markNameSerialized != null
      ? XmlAttribute(XmlName('MarkName'), markNameSerialized)
      : null;
  if (markNameConstructed != null) {
    attributes.add(markNameConstructed);
  }
  final calculatedScoreString = instance.calculatedScoreString;
  final calculatedScoreStringSerialized = calculatedScoreString;
  final calculatedScoreStringConstructed =
      calculatedScoreStringSerialized != null
          ? XmlAttribute(
              XmlName('CalculatedScoreString'), calculatedScoreStringSerialized)
          : null;
  if (calculatedScoreStringConstructed != null) {
    attributes.add(calculatedScoreStringConstructed);
  }
  final calculatedScoreRaw = instance.calculatedScoreRaw;
  final calculatedScoreRawSerialized = calculatedScoreRaw;
  final calculatedScoreRawConstructed = calculatedScoreRawSerialized != null
      ? XmlAttribute(
          XmlName('CalculatedScoreRaw'), calculatedScoreRawSerialized)
      : null;
  if (calculatedScoreRawConstructed != null) {
    attributes.add(calculatedScoreRawConstructed);
  }
  return attributes;
}

List<XmlNode> _$MarkToXmlChildren(Mark instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final gradeCalculationSummary = instance.gradeCalculationSummary;
  final gradeCalculationSummarySerialized = gradeCalculationSummary;
  final gradeCalculationSummaryConstructed = XmlElement(
      XmlName('GradeCalculationSummary'),
      gradeCalculationSummarySerialized?.toXmlAttributes(
              namespaces: namespaces) ??
          [],
      gradeCalculationSummarySerialized?.toXmlChildren(
              namespaces: namespaces) ??
          []);
  children.add(gradeCalculationSummaryConstructed);
  final assignments = instance.assignments;
  final assignmentsSerialized = assignments;
  final assignmentsConstructed = XmlElement(
      XmlName('Assignments'),
      assignmentsSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      assignmentsSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(assignmentsConstructed);
  return children;
}

XmlElement _$MarkToXmlElement(Mark instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Mark'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$GradeCalculationSummaryBuildXmlChildren(
    GradeCalculationSummary instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final assignmentGradeCalcs = instance.assignmentGradeCalcs;
  final assignmentGradeCalcsSerialized = assignmentGradeCalcs;
  if (assignmentGradeCalcsSerialized != null) {
    for (final value in assignmentGradeCalcsSerialized) {
      builder.element('AssignmentGradeCalc', nest: () {
        value.buildXmlChildren(builder, namespaces: namespaces);
      });
    }
  }
}

void _$GradeCalculationSummaryBuildXmlElement(
    GradeCalculationSummary instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('GradeCalculationSummary', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

GradeCalculationSummary _$GradeCalculationSummaryFromXmlElement(
    XmlElement element) {
  final assignmentGradeCalcs = element.getElements('AssignmentGradeCalc');
  return GradeCalculationSummary(
      assignmentGradeCalcs: assignmentGradeCalcs
          ?.map((e) => AssignmentGradeCalc.fromXmlElement(e))
          .toList());
}

List<XmlAttribute> _$GradeCalculationSummaryToXmlAttributes(
    GradeCalculationSummary instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$GradeCalculationSummaryToXmlChildren(
    GradeCalculationSummary instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final assignmentGradeCalcs = instance.assignmentGradeCalcs;
  final assignmentGradeCalcsSerialized = assignmentGradeCalcs;
  final assignmentGradeCalcsConstructed = assignmentGradeCalcsSerialized?.map(
      (e) => XmlElement(
          XmlName('AssignmentGradeCalc'),
          e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  if (assignmentGradeCalcsConstructed != null) {
    children.addAll(assignmentGradeCalcsConstructed);
  }
  return children;
}

XmlElement _$GradeCalculationSummaryToXmlElement(
    GradeCalculationSummary instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('GradeCalculationSummary'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$AssignmentGradeCalcBuildXmlChildren(
    AssignmentGradeCalc instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final type = instance.type;
  final typeSerialized = type;
  if (typeSerialized != null) {
    builder.attribute('Type', typeSerialized);
  }
  final weight = instance.weight;
  final weightSerialized = weight;
  if (weightSerialized != null) {
    builder.attribute('Weight', weightSerialized);
  }
  final points = instance.points;
  final pointsSerialized = points;
  if (pointsSerialized != null) {
    builder.attribute('Points', pointsSerialized);
  }
  final pointsPossible = instance.pointsPossible;
  final pointsPossibleSerialized = pointsPossible;
  if (pointsPossibleSerialized != null) {
    builder.attribute('PointsPossible', pointsPossibleSerialized);
  }
  final weightedPct = instance.weightedPct;
  final weightedPctSerialized = weightedPct;
  if (weightedPctSerialized != null) {
    builder.attribute('WeightedPct', weightedPctSerialized);
  }
  final calculatedMark = instance.calculatedMark;
  final calculatedMarkSerialized = calculatedMark;
  if (calculatedMarkSerialized != null) {
    builder.attribute('CalculatedMark', calculatedMarkSerialized);
  }
}

void _$AssignmentGradeCalcBuildXmlElement(
    AssignmentGradeCalc instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('AssignmentGradeCalc', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

AssignmentGradeCalc _$AssignmentGradeCalcFromXmlElement(XmlElement element) {
  final type = element.getAttribute('Type');
  final weight = element.getAttribute('Weight');
  final points = element.getAttribute('Points');
  final pointsPossible = element.getAttribute('PointsPossible');
  final weightedPct = element.getAttribute('WeightedPct');
  final calculatedMark = element.getAttribute('CalculatedMark');
  return AssignmentGradeCalc(
      type: type,
      weight: weight,
      points: points,
      pointsPossible: pointsPossible,
      weightedPct: weightedPct,
      calculatedMark: calculatedMark);
}

List<XmlAttribute> _$AssignmentGradeCalcToXmlAttributes(
    AssignmentGradeCalc instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final type = instance.type;
  final typeSerialized = type;
  final typeConstructed = typeSerialized != null
      ? XmlAttribute(XmlName('Type'), typeSerialized)
      : null;
  if (typeConstructed != null) {
    attributes.add(typeConstructed);
  }
  final weight = instance.weight;
  final weightSerialized = weight;
  final weightConstructed = weightSerialized != null
      ? XmlAttribute(XmlName('Weight'), weightSerialized)
      : null;
  if (weightConstructed != null) {
    attributes.add(weightConstructed);
  }
  final points = instance.points;
  final pointsSerialized = points;
  final pointsConstructed = pointsSerialized != null
      ? XmlAttribute(XmlName('Points'), pointsSerialized)
      : null;
  if (pointsConstructed != null) {
    attributes.add(pointsConstructed);
  }
  final pointsPossible = instance.pointsPossible;
  final pointsPossibleSerialized = pointsPossible;
  final pointsPossibleConstructed = pointsPossibleSerialized != null
      ? XmlAttribute(XmlName('PointsPossible'), pointsPossibleSerialized)
      : null;
  if (pointsPossibleConstructed != null) {
    attributes.add(pointsPossibleConstructed);
  }
  final weightedPct = instance.weightedPct;
  final weightedPctSerialized = weightedPct;
  final weightedPctConstructed = weightedPctSerialized != null
      ? XmlAttribute(XmlName('WeightedPct'), weightedPctSerialized)
      : null;
  if (weightedPctConstructed != null) {
    attributes.add(weightedPctConstructed);
  }
  final calculatedMark = instance.calculatedMark;
  final calculatedMarkSerialized = calculatedMark;
  final calculatedMarkConstructed = calculatedMarkSerialized != null
      ? XmlAttribute(XmlName('CalculatedMark'), calculatedMarkSerialized)
      : null;
  if (calculatedMarkConstructed != null) {
    attributes.add(calculatedMarkConstructed);
  }
  return attributes;
}

List<XmlNode> _$AssignmentGradeCalcToXmlChildren(AssignmentGradeCalc instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$AssignmentGradeCalcToXmlElement(AssignmentGradeCalc instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('AssignmentGradeCalc'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$AssignmentsBuildXmlChildren(Assignments instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final assignments = instance.assignments;
  final assignmentsSerialized = assignments;
  if (assignmentsSerialized != null) {
    for (final value in assignmentsSerialized) {
      builder.element('Assignment', nest: () {
        value.buildXmlChildren(builder, namespaces: namespaces);
      });
    }
  }
}

void _$AssignmentsBuildXmlElement(Assignments instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Assignments', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Assignments _$AssignmentsFromXmlElement(XmlElement element) {
  final assignments = element.getElements('Assignment');
  return Assignments(
      assignments:
          assignments?.map((e) => Assignment.fromXmlElement(e)).toList());
}

List<XmlAttribute> _$AssignmentsToXmlAttributes(Assignments instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$AssignmentsToXmlChildren(Assignments instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final assignments = instance.assignments;
  final assignmentsSerialized = assignments;
  final assignmentsConstructed = assignmentsSerialized?.map((e) => XmlElement(
      XmlName('Assignment'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  if (assignmentsConstructed != null) {
    children.addAll(assignmentsConstructed);
  }
  return children;
}

XmlElement _$AssignmentsToXmlElement(Assignments instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Assignments'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$AssignmentBuildXmlChildren(Assignment instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final gradeBookID = instance.gradeBookID;
  final gradeBookIDSerialized = gradeBookID;
  if (gradeBookIDSerialized != null) {
    builder.attribute('GradebookID', gradeBookIDSerialized);
  }
  final measure = instance.measure;
  final measureSerialized = measure;
  if (measureSerialized != null) {
    builder.attribute('Measure', measureSerialized);
  }
  final type = instance.type;
  final typeSerialized = type;
  if (typeSerialized != null) {
    builder.attribute('Type', typeSerialized);
  }
  final date = instance.date;
  final dateSerialized = date;
  if (dateSerialized != null) {
    builder.attribute('Date', dateSerialized);
  }
  final dueDate = instance.dueDate;
  final dueDateSerialized = dueDate;
  if (dueDateSerialized != null) {
    builder.attribute('DueDate', dueDateSerialized);
  }
  final score = instance.score;
  final scoreSerialized = score;
  if (scoreSerialized != null) {
    builder.attribute('Score', scoreSerialized);
  }
  final scoreType = instance.scoreType;
  final scoreTypeSerialized = scoreType;
  if (scoreTypeSerialized != null) {
    builder.attribute('ScoreType', scoreTypeSerialized);
  }
  final points = instance.points;
  final pointsSerialized = points;
  if (pointsSerialized != null) {
    builder.attribute('Points', pointsSerialized);
  }
  final notes = instance.notes;
  final notesSerialized = notes;
  if (notesSerialized != null) {
    builder.attribute('Notes', notesSerialized);
  }
  final teacherID = instance.teacherID;
  final teacherIDSerialized = teacherID;
  if (teacherIDSerialized != null) {
    builder.attribute('TeacherID', teacherIDSerialized);
  }
  final studentID = instance.studentID;
  final studentIDSerialized = studentID;
  if (studentIDSerialized != null) {
    builder.attribute('StudentID', studentIDSerialized);
  }
  final measureDescription = instance.measureDescription;
  final measureDescriptionSerialized = measureDescription;
  if (measureDescriptionSerialized != null) {
    builder.attribute('MeasureDescription', measureDescriptionSerialized);
  }
  final hasDropBox = instance.hasDropBox;
  final hasDropBoxSerialized = hasDropBox;
  if (hasDropBoxSerialized != null) {
    builder.attribute('HasDropBox', hasDropBoxSerialized);
  }
  final dropStartDate = instance.dropStartDate;
  final dropStartDateSerialized = dropStartDate;
  if (dropStartDateSerialized != null) {
    builder.attribute('DropStartDate', dropStartDateSerialized);
  }
  final dropEndDate = instance.dropEndDate;
  final dropEndDateSerialized = dropEndDate;
  if (dropEndDateSerialized != null) {
    builder.attribute('DropEndDate', dropEndDateSerialized);
  }
}

void _$AssignmentBuildXmlElement(Assignment instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('Assignment', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Assignment _$AssignmentFromXmlElement(XmlElement element) {
  final gradeBookID = element.getAttribute('GradebookID');
  final measure = element.getAttribute('Measure');
  final type = element.getAttribute('Type');
  final date = element.getAttribute('Date');
  final dueDate = element.getAttribute('DueDate');
  final score = element.getAttribute('Score');
  final scoreType = element.getAttribute('ScoreType');
  final points = element.getAttribute('Points');
  final notes = element.getAttribute('Notes');
  final teacherID = element.getAttribute('TeacherID');
  final studentID = element.getAttribute('StudentID');
  final measureDescription = element.getAttribute('MeasureDescription');
  final hasDropBox = element.getAttribute('HasDropBox');
  final dropStartDate = element.getAttribute('DropStartDate');
  final dropEndDate = element.getAttribute('DropEndDate');
  return Assignment(
      gradeBookID: gradeBookID,
      measure: measure,
      type: type,
      date: date,
      dueDate: dueDate,
      score: score,
      scoreType: scoreType,
      points: points,
      notes: notes,
      teacherID: teacherID,
      studentID: studentID,
      measureDescription: measureDescription,
      hasDropBox: hasDropBox,
      dropStartDate: dropStartDate,
      dropEndDate: dropEndDate);
}

List<XmlAttribute> _$AssignmentToXmlAttributes(Assignment instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final gradeBookID = instance.gradeBookID;
  final gradeBookIDSerialized = gradeBookID;
  final gradeBookIDConstructed = gradeBookIDSerialized != null
      ? XmlAttribute(XmlName('GradebookID'), gradeBookIDSerialized)
      : null;
  if (gradeBookIDConstructed != null) {
    attributes.add(gradeBookIDConstructed);
  }
  final measure = instance.measure;
  final measureSerialized = measure;
  final measureConstructed = measureSerialized != null
      ? XmlAttribute(XmlName('Measure'), measureSerialized)
      : null;
  if (measureConstructed != null) {
    attributes.add(measureConstructed);
  }
  final type = instance.type;
  final typeSerialized = type;
  final typeConstructed = typeSerialized != null
      ? XmlAttribute(XmlName('Type'), typeSerialized)
      : null;
  if (typeConstructed != null) {
    attributes.add(typeConstructed);
  }
  final date = instance.date;
  final dateSerialized = date;
  final dateConstructed = dateSerialized != null
      ? XmlAttribute(XmlName('Date'), dateSerialized)
      : null;
  if (dateConstructed != null) {
    attributes.add(dateConstructed);
  }
  final dueDate = instance.dueDate;
  final dueDateSerialized = dueDate;
  final dueDateConstructed = dueDateSerialized != null
      ? XmlAttribute(XmlName('DueDate'), dueDateSerialized)
      : null;
  if (dueDateConstructed != null) {
    attributes.add(dueDateConstructed);
  }
  final score = instance.score;
  final scoreSerialized = score;
  final scoreConstructed = scoreSerialized != null
      ? XmlAttribute(XmlName('Score'), scoreSerialized)
      : null;
  if (scoreConstructed != null) {
    attributes.add(scoreConstructed);
  }
  final scoreType = instance.scoreType;
  final scoreTypeSerialized = scoreType;
  final scoreTypeConstructed = scoreTypeSerialized != null
      ? XmlAttribute(XmlName('ScoreType'), scoreTypeSerialized)
      : null;
  if (scoreTypeConstructed != null) {
    attributes.add(scoreTypeConstructed);
  }
  final points = instance.points;
  final pointsSerialized = points;
  final pointsConstructed = pointsSerialized != null
      ? XmlAttribute(XmlName('Points'), pointsSerialized)
      : null;
  if (pointsConstructed != null) {
    attributes.add(pointsConstructed);
  }
  final notes = instance.notes;
  final notesSerialized = notes;
  final notesConstructed = notesSerialized != null
      ? XmlAttribute(XmlName('Notes'), notesSerialized)
      : null;
  if (notesConstructed != null) {
    attributes.add(notesConstructed);
  }
  final teacherID = instance.teacherID;
  final teacherIDSerialized = teacherID;
  final teacherIDConstructed = teacherIDSerialized != null
      ? XmlAttribute(XmlName('TeacherID'), teacherIDSerialized)
      : null;
  if (teacherIDConstructed != null) {
    attributes.add(teacherIDConstructed);
  }
  final studentID = instance.studentID;
  final studentIDSerialized = studentID;
  final studentIDConstructed = studentIDSerialized != null
      ? XmlAttribute(XmlName('StudentID'), studentIDSerialized)
      : null;
  if (studentIDConstructed != null) {
    attributes.add(studentIDConstructed);
  }
  final measureDescription = instance.measureDescription;
  final measureDescriptionSerialized = measureDescription;
  final measureDescriptionConstructed = measureDescriptionSerialized != null
      ? XmlAttribute(
          XmlName('MeasureDescription'), measureDescriptionSerialized)
      : null;
  if (measureDescriptionConstructed != null) {
    attributes.add(measureDescriptionConstructed);
  }
  final hasDropBox = instance.hasDropBox;
  final hasDropBoxSerialized = hasDropBox;
  final hasDropBoxConstructed = hasDropBoxSerialized != null
      ? XmlAttribute(XmlName('HasDropBox'), hasDropBoxSerialized)
      : null;
  if (hasDropBoxConstructed != null) {
    attributes.add(hasDropBoxConstructed);
  }
  final dropStartDate = instance.dropStartDate;
  final dropStartDateSerialized = dropStartDate;
  final dropStartDateConstructed = dropStartDateSerialized != null
      ? XmlAttribute(XmlName('DropStartDate'), dropStartDateSerialized)
      : null;
  if (dropStartDateConstructed != null) {
    attributes.add(dropStartDateConstructed);
  }
  final dropEndDate = instance.dropEndDate;
  final dropEndDateSerialized = dropEndDate;
  final dropEndDateConstructed = dropEndDateSerialized != null
      ? XmlAttribute(XmlName('DropEndDate'), dropEndDateSerialized)
      : null;
  if (dropEndDateConstructed != null) {
    attributes.add(dropEndDateConstructed);
  }
  return attributes;
}

List<XmlNode> _$AssignmentToXmlChildren(Assignment instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$AssignmentToXmlElement(Assignment instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('Assignment'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}
