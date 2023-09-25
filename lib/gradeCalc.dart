import 'dart:collection';

import 'Serialization/DeserializeXml.dart';
import 'dart:convert';

const NOT_GRADED = "Not Graded";

enum GradingSystem {
  Regular,
  FourPointScale
}

class CourseGrade {
  double gradeValue = 0.0;
  GradingSystem gradingSystem = GradingSystem.Regular;
}

class CategoryDetails {
  double pointsEarned = 0.0;
  double pointsPossible = 0.0;
  double weight = 0.0;
  GradingSystem gradingSystem = GradingSystem.Regular;
}

class GradeCalculator {
  static String getAssignmentPointsEarnedDisplay(Assignment assignment) {
    if (assignment.score == NOT_GRADED) {
      return 'Not Graded';
    } else {
      return assignment.pointsEarned.toString();
    }
  }

  static String getAssignmentPointsPossibleDisplay(Assignment assignment) {
    if (assignment.score == NOT_GRADED) {
      return 'Not Graded';
    } else {
      return assignment.pointsPossible.toString();
    }
  }

  //calculate grade as percentage (without percent sign), round to 2 decimal points
  static String calculateGradeDisplay(Mark period) {
    CourseGrade grade = calculateGrade(period);
    if (grade == NOT_GRADED) {
      return 'N/A';
    } else {
      if (grade.gradingSystem == GradingSystem.Regular) {
        return '${(100*grade.gradeValue).toStringAsFixed(2)}%';
      } else {
        return '${grade.gradeValue.toStringAsFixed(2)} / 4';
      }
    }
  }

  /// calculate grade
  /// any category out of 0 points are not counted
  /// if a category is all extra credit and is 5/0, it will also be not counted
  /// return as decimal (0.912 instead of 91.2)
  static CourseGrade calculateGrade(Mark period) {
     HashMap<String, CategoryDetails> categoryMap =  HashMap();
     List<AssignmentGradeCalc> categories = period.gradeCalculationSummary?.assignmentGradeCalcs ?? [];
     populateCategoryDetails(categories, categoryMap);

     //Step 2: Calculate the grade for the category given each assignment
     List<Assignment> assignments = period.assignments?.assignments ?? [];
     populateCategoryPoints(assignments, categoryMap, categories);

     //Step 3: Put it all together now, divide the points earned by points possible then multiply by the weight
     return calculateOverallCourseGrade(categoryMap);
   }

  static void populateCategoryDetails(List<AssignmentGradeCalc> categories, HashMap<String, CategoryDetails> categoryMap) {
    // If there is only one overall category in the class, then we simply create one entry to store all assignment points
     if (categories.isEmpty) {
       CategoryDetails details = CategoryDetails();
       details.weight = 1.0;
       categoryMap.addAll({"Total" : details});
       return;
     }

     for (var category in categories) {
       String name = category.type ?? "Undefined";

       if (name == "TOTAL") {
         continue;
       }

       String weightString = category.weight ?? "0%";
       double weight = double.parse(weightString.substring(0, (weightString.length) - 1));

       CategoryDetails details = CategoryDetails();
       details.weight = weight / 100; //Turns 10% into 0.10 for the future math use

       categoryMap.addAll({name : details});
     }
   }

  static void populateCategoryPoints(List<Assignment> assignments, HashMap<String, CategoryDetails> categoryMap, List<AssignmentGradeCalc> categories) {
    for (Assignment assignment in assignments) {
       String pointsString = assignment.points ?? "0.00 / 0.00";
       String pointsEarnedString = pointsString.split(" ")[0];
       String pointsPossibleString = pointsString.split(" ")[2];

       // If an assignment hasn't been graded yet then it will say x amount of points Possible, we can't use that
       // if (pointsString.contains("Possible")) {
       //   continue;
       // }

       if (categories.isEmpty) {
         categoryMap["Total"]?.pointsPossible += assignment.pointsPossible;
         categoryMap["Total"]?.pointsEarned += assignment.pointsEarned;

         if ((assignment.scoreType ?? "Raw Score") == "Rubric 0-4") {
           categoryMap["Total"]?.gradingSystem = GradingSystem.FourPointScale;
         }
       } else {
         categoryMap[assignment.type]?.pointsPossible += assignment.pointsPossible;
         categoryMap[assignment.type]?.pointsEarned += assignment.pointsEarned;

         if ((assignment.scoreType ?? "Raw Score") == "Rubric 0-4") {
           categoryMap[assignment.type]?.gradingSystem = GradingSystem.FourPointScale;
         }
       }
     }
   }

  static CourseGrade calculateOverallCourseGrade(HashMap<String, CategoryDetails> categoryMap) {
     CourseGrade courseGrade = CourseGrade();
     double overflowWeight = 0.0;
     // IF there are no points possible in a category, then there are no assignments
     // Therefore, we must add the weight of this category to an overflow and distribute it to the others
     categoryMap.forEach((name, details) {
       if (details.pointsPossible == 0) {
         overflowWeight += details.weight;
       }
     });
     print("overflow: $overflowWeight");
     // With the overflow, we have to find the correct multiplier for the other categories with points
     double multiplier = 1; // Default value if there are no empty categories
     if (overflowWeight != 0) {
       double weightWithAssignments = 1 - overflowWeight; // By subtracting the weight of the categories with no points we can calculate the weight of the categories with points
       multiplier = 1 / weightWithAssignments;
       print("multiplier: $multiplier");
     }

     categoryMap.forEach((name, details) {
       if (details.pointsPossible != 0) {
         double unweightedScore;
         if (details.gradingSystem == GradingSystem.Regular) {
           unweightedScore = details.pointsEarned / details.pointsPossible; // Example: 9/10 = 0.9
         } else {
           unweightedScore = details.pointsEarned / (details.pointsPossible / 4); // Example: 82 / 94 = 3.41
           courseGrade.gradingSystem = GradingSystem.FourPointScale;
         }

         double weightedScore = double.parse((unweightedScore * (details.weight * multiplier)).toStringAsFixed(4)); // Example continued 0.9 * 0.1 = 9% of grade
         print("$name: $weightedScore");

         courseGrade.gradeValue += weightedScore;
       }
     });

     return courseGrade;
   }
}