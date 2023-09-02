import 'dart:collection';

import 'Serialization/DeserializeXml.dart';
import 'dart:convert';

const NOT_GRADED = "Not Graded";

class GradeCalculator {
  String getAssignmentPointsEarnedDisplay(Assignment assignment) {
    if (assignment.score == NOT_GRADED) {
      return 'Not Graded';
    } else {
      return assignment.pointsEarned.toString();
    }
  }

  String getAssignmentPointsPossibleDisplay(Assignment assignment) {
    if (assignment.score == NOT_GRADED) {
      return 'Not Graded';
    } else {
      return assignment.pointsPossible.toString();
    }
  }

  //calculate grade as percentage (without percent sign), round to 2 decimal points
  String calculateGradeDisplay(Mark period) {
    var grade = calculateGrade(period);
    if (grade == NOT_GRADED) {
      return 'N/A';
    } else {
      print("${(100*grade).toStringAsFixed(2)}%");
      return '${(100*grade).toStringAsFixed(2)}%';
    }
  }

  /// calculate grade
  /// any category out of 0 points are not counted
  ///     if a category is all extra credit and is 5/0, it will also be not counted
  /// return as decimal (0.912 instead of 91.2)
   calculateGrade(Mark period) {
    var categoriesWithDetails = calculateCategoryDetails(period);
    double weightOfValidCategories = 0;
    for (var category in categoriesWithDetails) {
      if (category.stringGrade != NOT_GRADED) {
        weightOfValidCategories += double.parse(category.weight ?? "0.00");
      }
    }

    if (weightOfValidCategories == 0) {
      return NOT_GRADED;
    }

    double weightScale = 1/weightOfValidCategories;
    double grade = 0;
    for (var category in categoriesWithDetails) {
      if (category.stringGrade != NOT_GRADED) {
        grade += category.decimalGrade * double.parse(category.weight?.substring(0, (category.weight?.length ?? 0) - 1) ?? '0.00');
      }
    }
    grade *= weightScale;
    return grade;
  }

  List<AssignmentGradeCalc> calculateCategoryDetails(Mark period) {
    List<AssignmentGradeCalc> categories = period.getCategories(); //TODO maybe need to clone

    //Convert the list of categories into a map that {name, category}
    HashMap<String, AssignmentGradeCalc> categoriesMap = HashMap();
    for (AssignmentGradeCalc category in categories) {
      categoriesMap.addAll({(category.type ?? "Undefined"): category});
    }

    for (Assignment assignment in period.getAssignments()) {
      if ((assignment.score ?? NOT_GRADED) == NOT_GRADED) {
        continue;
      } else {
        categoriesMap[assignment.type]?.pointsEarnedDecimal += assignment.pointsEarned;
        categoriesMap[assignment.type]?.pointsPossibleDecimal += assignment.pointsPossible;
      }
    }
    categoriesMap.forEach((name, category) {
      if (category.pointsPossible == '0.00') {
        category.stringGrade = NOT_GRADED;
      } else {
        category.decimalGrade = category.pointsEarnedDecimal / category.pointsPossibleDecimal;
        category.stringGrade = (category.pointsEarnedDecimal / category.pointsPossibleDecimal).toString();
      }
    });

    //Turn it back into a list for the next function
    List<AssignmentGradeCalc> newCategories = <AssignmentGradeCalc>[];

    categoriesMap.forEach((key, value) {
      newCategories.add(value);
    });

    return newCategories;
  }

  /// return assignment weight as decimal, errors out (and returns 1 to not break anything) if pointsPossible is not graded
  ///
  /// if pointsEarned is not graded, this will calculate weight as if it was graded
   calculateAssignmentWeight(Mark period, int assignmentInd) {
    if(period.getAssignments()[assignmentInd].score == NOT_GRADED) {
      print('calculateAssignmentWeight received assignment with pointsPossible = not graded');
      return 1;
    }

    Mark periodClone = period; // TODO Maybe need to clone

    periodClone.getAssignments()[assignmentInd].pointsEarned = 0.00;
    var gradeIf0 = calculateGrade(periodClone);

    periodClone.getAssignments()[assignmentInd].pointsEarned = periodClone.getAssignments()[assignmentInd].pointsPossible;
    var gradeIfFullScore = calculateGrade(periodClone);

    var weight = gradeIfFullScore - gradeIf0;
    return weight;
  }

  String calculateAssignmentWeightDisplay(Mark period, int assignmentInd) {
    if (period.getAssignments()[assignmentInd].score == NOT_GRADED) {
      return 'N/A';
    } else {
      double weight = calculateAssignmentWeight(period, assignmentInd);
      if(weight.isNaN) {
        print('is NaN here');
      }
      return '${(100*weight).toStringAsFixed(2)}%';
    }
  }

  String calculateAssignmentGradeDisplay(Assignment assignment) {
    if(assignment.score == NOT_GRADED) {
      return 'N/A';
    } else {
      return '${(100*assignment.pointsEarned/assignment.pointsPossible).toStringAsFixed(2)}%';
    }
  }
}