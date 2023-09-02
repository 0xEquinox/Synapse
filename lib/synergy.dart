import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'Serialization/DeserializeXml.dart';
import 'package:xml/xml.dart';
import 'dart:io';

class Synergy {
  static GradeBook populateScores(GradeBook gradebook) {
    for (int i = 0; i < (gradebook.courses?.courses?.length ?? 0); i++) {
      for (int j = 0;
          j <
              (gradebook.courses?.courses?[i].marks?.marks?[0].assignments
                      ?.assignments?.length ??
                  0);
          j++) {
        Assignment? current = gradebook
            .courses?.courses?[i].marks?.marks?[0].assignments?.assignments?[j];
        if (current?.points?.contains(" / ") ?? true) {
          current?.pointsPossible =
              double.parse(current.points?.split(" / ")[1].trim() ?? '0.00');
          current?.pointsEarned =
              double.parse(current.points?.split(" / ")[0].trim() ?? '0.00');
        }
      }
    }

    return gradebook;
  }

  static Future<GradeBook?> login(username, password) async {
    // final dio = Dio();
    // var response = await dio.post('https://wa-bsd405-psv.edupoint.com/Service/PXPCommunication.asmx/ProcessWebServiceRequest', data: {
    //   'userID': username,
    //   'password': password,
    //   'skipLoginLog': true,
    //   'parent': false,
    //   'webServiceHandleName': 'PXPWebServices',
    //   'methodName': 'Gradebook',
    //   'paramStr': '<Parms><ChildIntID>0</ChildIntID><ReportPeriod>1</ReportPeriod></Parms>'
    // });
    //
    // if (response.data['d'].length < 1000) {
    //   return null;
    // }

    String response_offline = """<?xml version="1.0" encoding="UTF-8"?>
                    <Gradebook xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Type="Traditional" ErrorMessage="" HideStandardGraphInd="false" HideMarksColumnElementary="true" HidePointsColumnElementary="false" HidePercentSecondary="false" DisplayStandardsData="true" GBStandardsTabDefault="true">
                       <ReportingPeriods>
                          <ReportPeriod Index="0" GradePeriod="Quarter 1" StartDate="9/1/2022" EndDate="11/7/2022" />
                          <ReportPeriod Index="1" GradePeriod="Semester 1 Final" StartDate="11/8/2022" EndDate="1/27/2023" />
                          <ReportPeriod Index="2" GradePeriod="Quarter 3" StartDate="1/30/2023" EndDate="4/20/2023" />
                          <ReportPeriod Index="3" GradePeriod="Semester 2 FInal" StartDate="4/21/2023" EndDate="6/22/2023" />
                       </ReportingPeriods>
                       <ReportingPeriod GradePeriod="Semester 2 FInal" StartDate="4/21/2023" EndDate="6/22/2023" />
                       <Courses>
                          <Course UsesRichContent="true" Period="1" Title="AP Comp Sci Princ (CTA504.0)" Room="101" Staff="Marc Shepard" StaffEMail="shepardm@bsd405.org" StaffGU="FBA20BDE-1D83-4B51-A2BA-9E0F51B4767B" HighlightPercentageCutOffForProgressBar="50">
                             <Marks>
                                <Mark MarkName="S2 Final" CalculatedScoreString="A" CalculatedScoreRaw="95">
                                   <StandardViews />
                                   <GradeCalculationSummary>
                                      <AssignmentGradeCalc Type="Performance task" Weight="10%" Points="47.00" PointsPossible="49.00" WeightedPct="9.59%" CalculatedMark="A" />
                                      <AssignmentGradeCalc Type="Formative Assessment" Weight="20%" Points="22.00" PointsPossible="23.00" WeightedPct="19.13%" CalculatedMark="A" />
                                      <AssignmentGradeCalc Type="Assignment" Weight="10%" Points="103.00" PointsPossible="127.00" WeightedPct="8.11%" CalculatedMark="B" />
                                      <AssignmentGradeCalc Type="Summative Assessment" Weight="50%" Points="39.00" PointsPossible="40.00" WeightedPct="48.75%" CalculatedMark="A" />
                                      <AssignmentGradeCalc Type="Projects" Weight="10%" Points="108.00" PointsPossible="110.00" WeightedPct="9.82%" CalculatedMark="A" />
                                      <AssignmentGradeCalc Type="TOTAL" Weight="100%" Points="319.00" PointsPossible="349.00" WeightedPct="95.00%" CalculatedMark="A" />
                                   </GradeCalculationSummary>
                                   <Assignments>
                                      <Assignment GradebookID="1077326" Measure="Participation bonus" Type="Participation" Date="1/30/2023" DueDate="6/9/2023" Score="2 out of 2.0000" ScoreType="Raw Score" Points="2.00 / 2.0000" Notes="" TeacherID="80537" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/1/2023" DropEndDate="3/1/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1144896" Measure="8 Project" Type="Projects" Date="6/8/2023" DueDate="6/9/2023" Score="20 out of 20.0000" ScoreType="Raw Score" Points="20.00 / 20.0000" Notes="Outstanding!!!" TeacherID="80537" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/8/2023" DropEndDate="6/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1140663" Measure="8 Exercises" Type="Assignment" Date="5/19/2023" DueDate="5/19/2023" Score="0 out of 14.0000" ScoreType="Raw Score" Points="0.00 / 14.0000" Notes="" TeacherID="80537" StudentID="35960" MeasureDescription="8 Exercises" HasDropBox="false" DropStartDate="1/1/1900" DropEndDate="1/1/1900">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1018277" Measure="Create task" Type="Performance task" Date="5/5/2023" DueDate="5/5/2023" Score="47 out of 49.0000" ScoreType="Raw Score" Points="47.00 / 49.0000" Notes="" TeacherID="80537" StudentID="35960" MeasureDescription="Create task" HasDropBox="false" DropStartDate="1/1/1900" DropEndDate="1/1/1900">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1104001" Measure="AP 2018 practice exam" Type="Formative Assessment" Date="3/31/2023" DueDate="4/28/2023" Score="1 out of 1.0000" ScoreType="Raw Score" Points="1.00 / 1.0000" Notes="" TeacherID="80537" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/21/2023" DropEndDate="4/21/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1103999" Measure="AP 2020 practice exam" Type="Formative Assessment" Date="3/31/2023" DueDate="4/24/2023" Score="1 out of 1.0000" ScoreType="Raw Score" Points="1.00 / 1.0000" Notes="" TeacherID="80537" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/21/2023" DropEndDate="4/21/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1103998" Measure="AP 2021 practice exam" Type="Formative Assessment" Date="3/31/2023" DueDate="4/20/2023" Score="1 out of 1.0000" ScoreType="Raw Score" Points="1.00 / 1.0000" Notes="" TeacherID="80537" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/27/2023" DropEndDate="4/27/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1108304" Measure="6 Exam" Type="Summative Assessment" Date="4/6/2023" DueDate="4/6/2023" Score="20 out of 20.0000" ScoreType="Raw Score" Points="20.00 / 20.0000" Notes="" TeacherID="80537" StudentID="35960" MeasureDescription="6 Exam" HasDropBox="false" DropStartDate="1/1/1900" DropEndDate="1/1/1900">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1098752" Measure="6 Exercises" Type="Assignment" Date="4/5/2023" DueDate="4/5/2023" Score="51 out of 57.0000" ScoreType="Raw Score" Points="51.00 / 57.0000" Notes="" TeacherID="80537" StudentID="35960" MeasureDescription="6 Exercises" HasDropBox="false" DropStartDate="1/1/1900" DropEndDate="1/1/1900">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1098753" Measure="6 Quizzes" Type="Formative Assessment" Date="3/31/2023" DueDate="3/31/2023" Score="9 out of 10.0000" ScoreType="Raw Score" Points="9.00 / 10.0000" Notes="" TeacherID="80537" StudentID="35960" MeasureDescription="6 Quizzes" HasDropBox="false" DropStartDate="1/1/1900" DropEndDate="1/1/1900">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1087930" Measure="5 Exam" Type="Summative Assessment" Date="3/14/2023" DueDate="3/14/2023" Score="19 out of 20.0000" ScoreType="Raw Score" Points="19.00 / 20.0000" Notes="" TeacherID="80537" StudentID="35960" MeasureDescription="5 Exam" HasDropBox="false" DropStartDate="1/1/1900" DropEndDate="1/1/1900">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1073850" Measure="5 Exercises" Type="Assignment" Date="3/13/2023" DueDate="3/13/2023" Score="52 out of 56.0000" ScoreType="Raw Score" Points="52.00 / 56.0000" Notes="" TeacherID="80537" StudentID="35960" MeasureDescription="5 Exercises" HasDropBox="false" DropStartDate="1/1/1900" DropEndDate="1/1/1900">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1087931" Measure="5 Project" Type="Projects" Date="3/10/2023" DueDate="3/10/2023" Score="88 out of 90.0000" ScoreType="Raw Score" Points="88.00 / 90.0000" Notes="" TeacherID="80537" StudentID="35960" MeasureDescription="5 Project" HasDropBox="false" DropStartDate="1/1/1900" DropEndDate="1/1/1900">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1073851" Measure="5 Quizzes" Type="Formative Assessment" Date="3/2/2023" DueDate="3/2/2023" Score="10 out of 10.0000" ScoreType="Raw Score" Points="10.00 / 10.0000" Notes="" TeacherID="80537" StudentID="35960" MeasureDescription="5 Quizzes" HasDropBox="false" DropStartDate="1/1/1900" DropEndDate="1/1/1900">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                   </Assignments>
                                </Mark>
                             </Marks>
                          </Course>
                          <Course UsesRichContent="true" Period="2" Title="AP French Lang (FRA801.0)" Room="115" Staff="Marie Gwenaelle Geslin" StaffEMail="geslinm@bsd405.org" StaffGU="8D34565A-8244-4079-8952-88CE3817A587" HighlightPercentageCutOffForProgressBar="50">
                             <Marks>
                                <Mark MarkName="S2 Final" CalculatedScoreString="B" CalculatedScoreRaw="3.4">
                                   <StandardViews />
                                   <GradeCalculationSummary>
                                      <AssignmentGradeCalc Type="Assignment" Weight="20%" Points="82.00" PointsPossible="96.00" WeightedPct="17.08%" CalculatedMark="B" />
                                      <AssignmentGradeCalc Type="Test" Weight="80%" Points="27.50" PointsPossible="32.00" WeightedPct="68.75%" CalculatedMark="B" />
                                   </GradeCalculationSummary>
                                   <Assignments>
                                      <Assignment GradebookID="1148998" Measure="Test 7b" Type="Test" Date="6/13/2023" DueDate="6/13/2023" Score="3.5" ScoreType="Rubric 0-4" Points="3.50 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/14/2023" DropEndDate="6/14/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1140076" Measure="Test 7a" Type="Test" Date="5/30/2023" DueDate="5/30/2023" Score="Not Graded" ScoreType="Rubric 0-4" Points="4.0000 Points Possible" Notes="Excused " TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/31/2023" DropEndDate="5/31/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1140659" Measure="6.8-L'Économie" Type="Assignment" Date="5/2/2023" DueDate="5/9/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/1/2023" DropEndDate="6/1/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1138309" Measure="Nearpod - Santé" Type="Assignment" Date="4/28/2023" DueDate="5/2/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/29/2023" DropEndDate="5/29/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1140656" Measure="6.7-Santé" Type="Assignment" Date="4/28/2023" DueDate="5/2/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/1/2023" DropEndDate="6/1/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1122222" Measure="6-Bilan" Type="Assignment" Date="4/28/2023" DueDate="4/28/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/1/2023" DropEndDate="5/1/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1122219" Measure="6.6-Comparaison Culturelle" Type="Assignment" Date="4/25/2023" DueDate="4/25/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/1/2023" DropEndDate="5/1/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1123782" Measure="Test 6b" Type="Test" Date="4/25/2023" DueDate="4/25/2023" Score="3.5" ScoreType="Rubric 0-4" Points="3.50 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/3/2023" DropEndDate="5/3/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1117707" Measure="6.5-Comparaison Culturelle" Type="Assignment" Date="4/21/2023" DueDate="4/21/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/25/2023" DropEndDate="4/25/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1117704" Measure="6.4-Essai Argumentatif" Type="Assignment" Date="4/18/2023" DueDate="4/18/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/25/2023" DropEndDate="4/25/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1110541" Measure="6.3-Présentation Audio" Type="Assignment" Date="4/7/2023" DueDate="4/7/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/15/2023" DropEndDate="4/15/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1109952" Measure="Test 6a" Type="Test" Date="4/4/2023" DueDate="4/4/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/8/2023" DropEndDate="4/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1105930" Measure="6.2-Article et Reportage Audio" Type="Assignment" Date="3/28/2023" DueDate="3/31/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/3/2023" DropEndDate="4/3/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1105927" Measure="6.1-Article et Graphique" Type="Assignment" Date="3/24/2023" DueDate="3/28/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/3/2023" DropEndDate="4/3/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1100980" Measure="6.0-Environnement" Type="Assignment" Date="3/24/2023" DueDate="3/24/2023" Score="3.5" ScoreType="Rubric 0-4" Points="3.50 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/27/2023" DropEndDate="3/27/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1100977" Measure="Québec" Type="Assignment" Date="3/21/2023" DueDate="3/21/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/27/2023" DropEndDate="3/27/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1100974" Measure="5.8-Bilan" Type="Assignment" Date="3/21/2023" DueDate="3/21/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="Updated 04/22 - 80%" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/27/2023" DropEndDate="3/27/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1096484" Measure="5.7-Comparaison Culturelle" Type="Assignment" Date="3/14/2023" DueDate="3/14/2023" Score="3.5" ScoreType="Rubric 0-4" Points="3.50 / 4.0000" Notes="Updated 04/22 - 80%" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/22/2023" DropEndDate="3/22/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1100938" Measure="5b-Comparaison" Type="Test" Date="3/14/2023" DueDate="3/14/2023" Score="3.5" ScoreType="Rubric 0-4" Points="3.50 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/27/2023" DropEndDate="3/27/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1100935" Measure="5b-Conversation" Type="Test" Date="3/14/2023" DueDate="3/14/2023" Score="3.5" ScoreType="Rubric 0-4" Points="3.50 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/27/2023" DropEndDate="3/27/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1100932" Measure="Test 5b-Courriel" Type="Test" Date="3/14/2023" DueDate="3/14/2023" Score="3.5" ScoreType="Rubric 0-4" Points="3.50 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/27/2023" DropEndDate="3/27/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1087172" Measure="5.6-Conversation" Type="Assignment" Date="3/10/2023" DueDate="3/10/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/13/2023" DropEndDate="3/13/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1080431" Measure="Test 5a" Type="Test" Date="3/3/2023" DueDate="3/3/2023" Score="3.5" ScoreType="Rubric 0-4" Points="3.50 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/3/2023" DropEndDate="3/3/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1081644" Measure="5.5-Reponse Courrier" Type="Assignment" Date="3/3/2023" DueDate="3/3/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/6/2023" DropEndDate="3/6/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1118696" Measure="Senegal" Type="Assignment" Date="3/1/2023" DueDate="3/1/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/26/2023" DropEndDate="4/26/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1081641" Measure="5.4-Instructions Audio" Type="Assignment" Date="2/28/2023" DueDate="2/28/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/6/2023" DropEndDate="3/6/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1074496" Measure="5.3-Entretien Audio" Type="Assignment" Date="2/17/2023" DueDate="2/17/2023" Score="2" ScoreType="Rubric 0-4" Points="2.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/21/2023" DropEndDate="2/21/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1074493" Measure="5.2-Graphique et Conversation Audio" Type="Assignment" Date="2/14/2023" DueDate="2/14/2023" Score="3.5" ScoreType="Rubric 0-4" Points="3.50 / 4.0000" Notes="Updated 04/03 - 80%" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/21/2023" DropEndDate="2/21/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1068380" Measure="5.1-Texte Littéraire" Type="Assignment" Date="2/10/2023" DueDate="2/10/2023" Score="2.5" ScoreType="Rubric 0-4" Points="2.50 / 4.0000" Notes="Updated 04/05 - 80%" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/13/2023" DropEndDate="2/13/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1057863" Measure="4.6-Essai" Type="Assignment" Date="2/3/2023" DueDate="2/3/2023" Score="1.5" ScoreType="Rubric 0-4" Points="1.50 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/6/2023" DropEndDate="2/6/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1068039" Measure="Test 4b" Type="Test" Date="2/2/2023" DueDate="2/2/2023" Score="3.5" ScoreType="Rubric 0-4" Points="3.50 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/13/2023" DropEndDate="2/13/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1057860" Measure="4.5-Comparaison Culturelle" Type="Assignment" Date="1/31/2023" DueDate="1/31/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/6/2023" DropEndDate="2/6/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1057857" Measure="4.4-Présentation Audio" Type="Assignment" Date="1/24/2023" DueDate="1/24/2023" Score="0.5" ScoreType="Rubric 0-4" Points="0.50 / 4.0000" Notes="" TeacherID="40752" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/6/2023" DropEndDate="2/6/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                   </Assignments>
                                </Mark>
                             </Marks>
                          </Course>
                          <Course UsesRichContent="true" Period="3" Title="AP US Hist (SSA601.0)" Room="208" Staff="Jessica Scott" StaffEMail="scottj@bsd405.org" StaffGU="CEE3F9E2-054E-400C-9F76-882B7EB59CAD" HighlightPercentageCutOffForProgressBar="70">
                             <Marks>
                                <Mark MarkName="S2 Final" CalculatedScoreString="A" CalculatedScoreRaw="3.5">
                                   <StandardViews />
                                   <GradeCalculationSummary>
                                      <AssignmentGradeCalc Type="HTS2 (Sourcing and Situation)" Weight="17%" Points="27.00" PointsPossible="32.00" WeightedPct="14.01%" CalculatedMark="B" />
                                      <AssignmentGradeCalc Type="HTS3 (Claims and Evidence in Sources)" Weight="17%" Points="33.00" PointsPossible="36.00" WeightedPct="15.22%" CalculatedMark="A" />
                                      <AssignmentGradeCalc Type="HTS1 (Developments and Processes)" Weight="17%" Points="57.00" PointsPossible="60.00" WeightedPct="15.87%" CalculatedMark="A" />
                                      <AssignmentGradeCalc Type="HTS6 (Argumentation)" Weight="17%" Points="65.00" PointsPossible="77.00" WeightedPct="14.10%" CalculatedMark="B" />
                                      <AssignmentGradeCalc Type="HTS5 (Making Connections)" Weight="17%" Points="30.00" PointsPossible="36.00" WeightedPct="13.92%" CalculatedMark="B" />
                                      <AssignmentGradeCalc Type="HTS4 (Contextualization)" Weight="17%" Points="26.00" PointsPossible="32.00" WeightedPct="13.57%" CalculatedMark="B" />
                                   </GradeCalculationSummary>
                                   <Assignments>
                                      <Assignment GradebookID="1148531" Measure="Presidential Debates - Con Statement" Type="HTS6 (Argumentation)" Date="6/14/2023" DueDate="6/14/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/14/2023" DropEndDate="6/14/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1148521" Measure="Presidential Debates - Pro Statement" Type="HTS6 (Argumentation)" Date="6/14/2023" DueDate="6/14/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/14/2023" DropEndDate="6/14/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1148502" Measure="Presidential Debates" Type="HTS5 (Making Connections)" Date="6/14/2023" DueDate="6/14/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/14/2023" DropEndDate="6/14/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1148484" Measure="Presidential Debate" Type="HTS4 (Contextualization)" Date="6/14/2023" DueDate="6/14/2023" Score="2" ScoreType="Rubric 0-4" Points="2.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/14/2023" DropEndDate="6/14/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1148472" Measure="Presidential Debate" Type="HTS1 (Developments and Processes)" Date="6/14/2023" DueDate="6/14/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/14/2023" DropEndDate="6/14/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1148055" Measure="Presidential Debate Connections" Type="HTS1 (Developments and Processes)" Date="6/12/2023" DueDate="6/12/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/13/2023" DropEndDate="6/13/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1148049" Measure="Presidential Debate Connections" Type="HTS6 (Argumentation)" Date="6/12/2023" DueDate="6/12/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/13/2023" DropEndDate="6/13/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1145195" Measure="U8: Unit SAQ" Type="HTS5 (Making Connections)" Date="5/18/2023" DueDate="5/18/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/8/2023" DropEndDate="6/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1145188" Measure="U8: Unit SAQ" Type="HTS3 (Claims and Evidence in Sources)" Date="5/18/2023" DueDate="5/18/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/8/2023" DropEndDate="6/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1121812" Measure="U8: ERA Discussion" Type="HTS6 (Argumentation)" Date="5/1/2023" DueDate="5/1/2023" Score="4" ScoreType="Rubric 0-4" Points="1.00 / 1.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/1/2023" DropEndDate="5/1/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1126239" Measure="U8: Comparison LEQ (Cold War) - ANALYSIS" Type="HTS5 (Making Connections)" Date="4/27/2023" DueDate="4/27/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/8/2023" DropEndDate="5/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1126230" Measure="U8: Comparison LEQ (Cold War) - CONTEXT" Type="HTS4 (Contextualization)" Date="4/27/2023" DueDate="4/27/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/8/2023" DropEndDate="5/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1126224" Measure="U8: Comparison LEQ (Cold War) - EVIDENCE" Type="HTS6 (Argumentation)" Date="4/27/2023" DueDate="4/27/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/8/2023" DropEndDate="5/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1126210" Measure="U8: Comparison LEQ (Cold War) - THESIS" Type="HTS6 (Argumentation)" Date="4/27/2023" DueDate="4/27/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/8/2023" DropEndDate="5/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1118644" Measure="U8: Civil Rights Discussion" Type="HTS6 (Argumentation)" Date="4/26/2023" DueDate="4/26/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/26/2023" DropEndDate="4/26/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1118638" Measure="U8: Civil Rights Discussion" Type="HTS1 (Developments and Processes)" Date="4/26/2023" DueDate="4/26/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/26/2023" DropEndDate="4/26/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1126138" Measure="U8: Vietnam War DBQ Outline" Type="HTS3 (Claims and Evidence in Sources)" Date="4/26/2023" DueDate="4/26/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/8/2023" DropEndDate="5/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1126129" Measure="U8: Vietnam War DBQ Outline" Type="HTS2 (Sourcing and Situation)" Date="4/26/2023" DueDate="4/26/2023" Score="4" ScoreType="Rubric 0-4 (copy)" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/8/2023" DropEndDate="5/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1111365" Measure="U8: Cold WAr Discussion" Type="HTS1 (Developments and Processes)" Date="4/17/2023" DueDate="4/17/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/17/2023" DropEndDate="4/17/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1112176" Measure="U8: Cold War Policy Paragraph" Type="HTS6 (Argumentation)" Date="4/17/2023" DueDate="4/17/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/18/2023" DropEndDate="4/18/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1112167" Measure="U8: Cold War Policy Paragraph" Type="HTS1 (Developments and Processes)" Date="4/17/2023" DueDate="4/17/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/18/2023" DropEndDate="4/18/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1118464" Measure="U7: SAQ (WWII)" Type="HTS5 (Making Connections)" Date="4/6/2023" DueDate="4/6/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/26/2023" DropEndDate="4/26/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1118458" Measure="U7: SAQ (WWII)" Type="HTS1 (Developments and Processes)" Date="4/6/2023" DueDate="4/6/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/26/2023" DropEndDate="4/26/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1108366" Measure="U7: MC Quiz" Type="HTS2 (Sourcing and Situation)" Date="4/6/2023" DueDate="4/6/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/6/2023" DropEndDate="4/6/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1108358" Measure="U7: MC Quiz" Type="HTS5 (Making Connections)" Date="4/6/2023" DueDate="4/6/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/6/2023" DropEndDate="4/6/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1108346" Measure="U7: MC Quiz" Type="HTS3 (Claims and Evidence in Sources)" Date="4/6/2023" DueDate="4/6/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/6/2023" DropEndDate="4/6/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1107916" Measure="U7: New Deal Discussion" Type="HTS6 (Argumentation)" Date="4/3/2023" DueDate="4/3/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/6/2023" DropEndDate="4/6/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1107910" Measure="U7: New Deal Discussion" Type="HTS1 (Developments and Processes)" Date="4/3/2023" DueDate="4/3/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/6/2023" DropEndDate="4/6/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1107600" Measure="U5: LEQ ANALYSIS (Self-Government)" Type="HTS5 (Making Connections)" Date="3/30/2023" DueDate="3/30/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/5/2023" DropEndDate="4/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1107597" Measure="U5: LEQ EVIDENCE (Self-Government)" Type="HTS6 (Argumentation)" Date="3/30/2023" DueDate="3/30/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/5/2023" DropEndDate="4/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1107594" Measure="U5: LEQ CONTEXT (Self-Government)" Type="HTS4 (Contextualization)" Date="3/30/2023" DueDate="3/30/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/5/2023" DropEndDate="4/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1107591" Measure="U5: LEQ THESIS (Self-Government)" Type="HTS6 (Argumentation)" Date="3/30/2023" DueDate="3/30/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/5/2023" DropEndDate="4/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1107745" Measure="U7: DBQ SOURCING (Imperialism)" Type="HTS2 (Sourcing and Situation)" Date="3/27/2023" DueDate="3/27/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/5/2023" DropEndDate="4/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1107705" Measure="U7: DBQ OUTSIDE EVIDENCE (Imperialism)" Type="HTS6 (Argumentation)" Date="3/27/2023" DueDate="3/27/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/5/2023" DropEndDate="4/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1107699" Measure="U7: DBQ DOCUMENT EVIDENCE (Imperialism)" Type="HTS3 (Claims and Evidence in Sources)" Date="3/27/2023" DueDate="3/27/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/5/2023" DropEndDate="4/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1107692" Measure="U7: DBQ CONTEXT (Imperialism)" Type="HTS4 (Contextualization)" Date="3/27/2023" DueDate="3/27/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/5/2023" DropEndDate="4/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1107686" Measure="U7: DBQ THESIS (Imperialism)" Type="HTS6 (Argumentation)" Date="3/27/2023" DueDate="3/27/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/5/2023" DropEndDate="4/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1100415" Measure="U7: Red Scare Discussion" Type="HTS1 (Developments and Processes)" Date="3/23/2023" DueDate="3/23/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/27/2023" DropEndDate="3/27/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1115665" Measure="U7: Change and Continuity LEQ (Progressives) - ANALYSIS" Type="HTS5 (Making Connections)" Date="3/20/2023" DueDate="3/20/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/23/2023" DropEndDate="4/23/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1115659" Measure="U7: Change and Continuity LEQ (Progressives) - EVIDENCE" Type="HTS6 (Argumentation)" Date="3/20/2023" DueDate="3/20/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/23/2023" DropEndDate="4/23/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1115653" Measure="U7: Change and Continuity LEQ (Progressives) - CONTEXT" Type="HTS4 (Contextualization)" Date="3/20/2023" DueDate="3/20/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/23/2023" DropEndDate="4/23/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1115647" Measure="U7: Change and Continuity LEQ (Progressives) - THESIS" Type="HTS6 (Argumentation)" Date="3/20/2023" DueDate="3/20/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/23/2023" DropEndDate="4/23/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1091708" Measure="U6: DBQ SOURCING (Industrialization)" Type="HTS2 (Sourcing and Situation)" Date="2/16/2023" DueDate="3/16/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/19/2023" DropEndDate="3/19/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1091690" Measure="U6: DBQ OUTSIDE EVIDENCE (Industrialization)" Type="HTS6 (Argumentation)" Date="2/16/2023" DueDate="3/16/2023" Score="0" ScoreType="Rubric 0-4" Points="0.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/19/2023" DropEndDate="3/19/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1087103" Measure="U7: Progressive Resume" Type="HTS1 (Developments and Processes)" Date="3/13/2023" DueDate="3/13/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/13/2023" DropEndDate="3/13/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1092716" Measure="U7: Great Migration" Type="HTS1 (Developments and Processes)" Date="3/13/2023" DueDate="3/13/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/20/2023" DropEndDate="3/20/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1089779" Measure="U7 Context (Spanish American War)" Type="HTS1 (Developments and Processes)" Date="3/8/2023" DueDate="3/8/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/15/2023" DropEndDate="3/15/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1089773" Measure="U7 Context (Spanish American War)" Type="HTS4 (Contextualization)" Date="3/8/2023" DueDate="3/8/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/15/2023" DropEndDate="3/15/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1086931" Measure="U7: MC Reading Quiz (Progressives)" Type="HTS1 (Developments and Processes)" Date="3/8/2023" DueDate="3/8/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/13/2023" DropEndDate="3/13/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1078412" Measure="U6: MC Quiz" Type="HTS5 (Making Connections)" Date="3/2/2023" DueDate="3/2/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/2/2023" DropEndDate="3/2/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1078334" Measure="U6: MC Quiz" Type="HTS3 (Claims and Evidence in Sources)" Date="3/2/2023" DueDate="3/2/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/2/2023" DropEndDate="3/2/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1091702" Measure="U6: DBQ DOCUMENT EVIDENCE (Industrialization)" Type="HTS3 (Claims and Evidence in Sources)" Date="2/16/2023" DueDate="2/16/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/19/2023" DropEndDate="3/19/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1091696" Measure="U6: DBQ CONTEXT (Industrialization)" Type="HTS4 (Contextualization)" Date="2/16/2023" DueDate="2/16/2023" Score="2" ScoreType="Rubric 0-4" Points="2.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/19/2023" DropEndDate="3/19/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1091684" Measure="U6: DBQ THESIS (Industrialization)" Type="HTS6 (Argumentation)" Date="2/16/2023" DueDate="2/16/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/19/2023" DropEndDate="3/19/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1072076" Measure="U6: Political Bosses Discussion" Type="HTS1 (Developments and Processes)" Date="2/16/2023" DueDate="2/16/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/16/2023" DropEndDate="2/16/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1071283" Measure="U6: DBQ Paragraph (Chinese Exclusion Act)" Type="HTS3 (Claims and Evidence in Sources)" Date="2/15/2023" DueDate="2/15/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/16/2023" DropEndDate="2/16/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1062761" Measure="U6: SAQ (Washington and DuBois)" Type="HTS6 (Argumentation)" Date="2/9/2023" DueDate="2/9/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/9/2023" DropEndDate="2/9/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1062755" Measure="U6: SAQ (Washington and DuBois)" Type="HTS1 (Developments and Processes)" Date="2/9/2023" DueDate="2/9/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/9/2023" DropEndDate="2/9/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1058821" Measure="U6: SAQ (Westward Expansion)" Type="HTS3 (Claims and Evidence in Sources)" Date="2/6/2023" DueDate="2/6/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/7/2023" DropEndDate="2/7/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1058813" Measure="U6: SAQ (Westward Expansion)" Type="HTS1 (Developments and Processes)" Date="2/6/2023" DueDate="2/6/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/7/2023" DropEndDate="2/7/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1054330" Measure="U6: Significance HAPPY Primary Source Analysis (Chief Joseph)" Type="HTS3 (Claims and Evidence in Sources)" Date="2/2/2023" DueDate="2/2/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/5/2023" DropEndDate="2/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1054304" Measure="U6: POV - HAPPY Primary Source Analysis (Chief Joseph)" Type="HTS2 (Sourcing and Situation)" Date="2/2/2023" DueDate="2/2/2023" Score="2" ScoreType="Rubric 0-4" Points="2.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/5/2023" DropEndDate="2/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1054293" Measure="U6: Purpose - HAPPY Primary Source Analysis (Chief Joseph)" Type="HTS2 (Sourcing and Situation)" Date="2/2/2023" DueDate="2/2/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/5/2023" DropEndDate="2/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1054287" Measure="U6: Aud. - HAPPY Primary Source Analysis (Chief Joseph)" Type="HTS2 (Sourcing and Situation)" Date="2/2/2023" DueDate="2/2/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/5/2023" DropEndDate="2/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1054281" Measure="U6: Context - HAPPY Primary Source Analysis (Chief Joseph)" Type="HTS2 (Sourcing and Situation)" Date="2/2/2023" DueDate="2/2/2023" Score="4" ScoreType="Rubric 0-4" Points="4.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/5/2023" DropEndDate="2/5/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1060613" Measure="U5: LEQ ANALYSIS (Reconstruction)" Type="HTS5 (Making Connections)" Date="1/30/2023" DueDate="1/30/2023" Score="2" ScoreType="Rubric 0-4" Points="2.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/8/2023" DropEndDate="2/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1060605" Measure="U5: LEQ EVIDENCE (Reconstruction)" Type="HTS6 (Argumentation)" Date="1/30/2023" DueDate="1/30/2023" Score="3" ScoreType="Rubric 0-4 (copy)" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/8/2023" DropEndDate="2/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1060594" Measure="U5: LEQ THESIS (Reconstruction)" Type="HTS6 (Argumentation)" Date="1/30/2023" DueDate="1/30/2023" Score="2" ScoreType="Rubric 0-4" Points="2.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/8/2023" DropEndDate="2/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1060586" Measure="U5: LEQ CONTEXT (Reconstruction)" Type="HTS4 (Contextualization)" Date="1/30/2023" DueDate="1/30/2023" Score="3" ScoreType="Rubric 0-4" Points="3.00 / 4.0000" Notes="" TeacherID="35376" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/8/2023" DropEndDate="2/8/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                   </Assignments>
                                </Mark>
                             </Marks>
                          </Course>
                          <Course UsesRichContent="false" Period="4" Title="AP Lang/Comp (ENA601.0)" Room="202" Staff="Jennifer Sorenson" StaffEMail="sorensonj@bsd405.org" StaffGU="9EE5E5C9-99AA-4B4A-95B7-9F73FD26E632" HighlightPercentageCutOffForProgressBar="71">
                             <Marks>
                                <Mark MarkName="S2 Final" CalculatedScoreString="A" CalculatedScoreRaw="92.89">
                                   <StandardViews />
                                   <GradeCalculationSummary>
                                      <AssignmentGradeCalc Type="Formative &amp; Final Assessments" Weight="75%" Points="405.50" PointsPossible="448.00" WeightedPct="67.89%" CalculatedMark="A" />
                                      <AssignmentGradeCalc Type="Book Projects" Weight="25%" Points="250.00" PointsPossible="250.00" WeightedPct="25.00%" CalculatedMark="A" />
                                      <AssignmentGradeCalc Type="TOTAL" Weight="100%" Points="655.50" PointsPossible="698.00" WeightedPct="92.89%" CalculatedMark="A" />
                                   </GradeCalculationSummary>
                                   <Assignments>
                                      <Assignment GradebookID="1142616" Measure="Vocab Final Exam Games" Type="Formative &amp; Final Assessments" Date="6/15/2023" DueDate="6/16/2023" Score="20 out of 20.0000" ScoreType="Raw Score" Points="20.00 / 20.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/5/2023" DropEndDate="6/6/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1130694" Measure="Choice Book 6" Type="Book Projects" Date="5/15/2023" DueDate="6/13/2023" Score="50 out of 50.0000" ScoreType="Raw Score" Points="50.00 / 50.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/15/2023" DropEndDate="5/16/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1142609" Measure="Obituary" Type="Formative &amp; Final Assessments" Date="6/1/2023" DueDate="6/9/2023" Score="13 out of 15.0000" ScoreType="Raw Score" Points="13.00 / 15.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/5/2023" DropEndDate="6/6/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1142600" Measure="Creamer Obit" Type="Formative &amp; Final Assessments" Date="6/1/2023" DueDate="6/2/2023" Score="0 out of 5.0000" ScoreType="Raw Score" Points="0.00 / 5.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/5/2023" DropEndDate="6/6/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1139211" Measure="Pasta Debates" Type="Formative &amp; Final Assessments" Date="5/30/2023" DueDate="5/31/2023" Score="15 out of 15.0000" ScoreType="Raw Score" Points="15.00 / 15.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/30/2023" DropEndDate="5/31/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1130688" Measure="Semester 2 Comp. Book" Type="Formative &amp; Final Assessments" Date="5/15/2023" DueDate="5/15/2023" Score="95 out of 100.0000" ScoreType="Raw Score" Points="95.00 / 100.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/15/2023" DropEndDate="5/16/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1118300" Measure="Choice Book 5" Type="Book Projects" Date="3/20/2023" DueDate="4/25/2023" Score="100 out of 100.0000" ScoreType="Raw Score" Points="100.00 / 100.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/26/2023" DropEndDate="4/27/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1117258" Measure="Argument Essay 4" Type="Formative &amp; Final Assessments" Date="4/20/2023" DueDate="4/21/2023" Score="11 out of 10.0000" ScoreType="Raw Score" Points="11.00 / 10.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/25/2023" DropEndDate="4/26/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1117253" Measure="Opinion Pieces" Type="Formative &amp; Final Assessments" Date="4/17/2023" DueDate="4/21/2023" Score="10 out of 10.0000" ScoreType="Raw Score" Points="10.00 / 10.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/25/2023" DropEndDate="4/26/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1113685" Measure="Vocab 10 Work + Quiz" Type="Formative &amp; Final Assessments" Date="4/20/2023" DueDate="4/21/2023" Score="6 out of 6.0000" ScoreType="Raw Score" Points="6.00 / 6.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/20/2023" DropEndDate="4/21/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1113678" Measure="Arg Essay: Art quote" Type="Formative &amp; Final Assessments" Date="4/20/2023" DueDate="4/20/2023" Score="11 out of 10.0000" ScoreType="Raw Score" Points="11.00 / 10.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/20/2023" DropEndDate="4/21/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1117250" Measure="Lippmann" Type="Formative &amp; Final Assessments" Date="4/4/2023" DueDate="4/5/2023" Score="9 out of 10.0000" ScoreType="Raw Score" Points="9.00 / 10.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/25/2023" DropEndDate="4/26/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1111453" Measure="Vocab 9 Quiz" Type="Formative &amp; Final Assessments" Date="4/4/2023" DueDate="4/5/2023" Score="8 out of 9.0000" ScoreType="Raw Score" Points="8.00 / 9.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/17/2023" DropEndDate="4/18/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1111450" Measure="Vocab 9 Work" Type="Formative &amp; Final Assessments" Date="4/4/2023" DueDate="4/5/2023" Score="5 out of 5.0000" ScoreType="Raw Score" Points="5.00 / 5.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/17/2023" DropEndDate="4/18/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1103843" Measure="Public Art Project" Type="Formative &amp; Final Assessments" Date="3/20/2023" DueDate="3/31/2023" Score="41 out of 50.0000" ScoreType="Raw Score" Points="41.00 / 50.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/31/2023" DropEndDate="4/1/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1089441" Measure="Murals Suite" Type="Formative &amp; Final Assessments" Date="3/14/2023" DueDate="3/24/2023" Score="23 out of 25.0000" ScoreType="Raw Score" Points="23.00 / 25.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/15/2023" DropEndDate="3/16/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1097949" Measure="Essay: Art" Type="Formative &amp; Final Assessments" Date="3/20/2023" DueDate="3/20/2023" Score="4.5 out of 5.0000" ScoreType="Raw Score" Points="4.50 / 5.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/23/2023" DropEndDate="3/24/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1089434" Measure="SOAPSTone Photos" Type="Formative &amp; Final Assessments" Date="3/10/2023" DueDate="3/14/2023" Score="14 out of 15.0000" ScoreType="Raw Score" Points="14.00 / 15.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/15/2023" DropEndDate="3/16/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1078725" Measure="Vocab 8 Quiz" Type="Formative &amp; Final Assessments" Date="2/13/2023" DueDate="3/14/2023" Score="3 out of 3.0000" ScoreType="Raw Score" Points="3.00 / 3.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/2/2023" DropEndDate="3/3/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1078722" Measure="Vocab 8 Work" Type="Formative &amp; Final Assessments" Date="2/27/2023" DueDate="3/14/2023" Score="5 out of 5.0000" ScoreType="Raw Score" Points="5.00 / 5.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/2/2023" DropEndDate="3/3/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1078728" Measure="Okefenokee + Wilson Activities" Type="Formative &amp; Final Assessments" Date="2/2/2023" DueDate="3/10/2023" Score="14 out of 20.0000" ScoreType="Raw Score" Points="14.00 / 20.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/2/2023" DropEndDate="3/3/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1078741" Measure="CB4 Project &amp;amp; Journal" Type="Book Projects" Date="1/30/2023" DueDate="3/7/2023" Score="100 out of 100.0000" ScoreType="Raw Score" Points="100.00 / 100.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/2/2023" DropEndDate="3/3/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1081332" Measure="Synthesis Essay 2" Type="Formative &amp; Final Assessments" Date="2/27/2023" DueDate="2/28/2023" Score="11 out of 10.0000" ScoreType="Raw Score" Points="11.00 / 10.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/6/2023" DropEndDate="3/7/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1062989" Measure="Synthesis: DST + Workshop" Type="Formative &amp; Final Assessments" Date="2/9/2023" DueDate="2/17/2023" Score="9 out of 9.0000" ScoreType="Raw Score" Points="9.00 / 9.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="Writing the essay; participating in the evaluation thereof" HasDropBox="false" DropStartDate="2/9/2023" DropEndDate="2/10/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1071881" Measure="Vocab 7 Quiz" Type="Formative &amp; Final Assessments" Date="2/16/2023" DueDate="2/16/2023" Score="8 out of 8.0000" ScoreType="Raw Score" Points="8.00 / 8.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/16/2023" DropEndDate="2/17/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1071878" Measure="Vocab 7 Work" Type="Formative &amp; Final Assessments" Date="2/16/2023" DueDate="2/16/2023" Score="4 out of 5.0000" ScoreType="Raw Score" Points="4.00 / 5.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/16/2023" DropEndDate="2/17/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1062972" Measure="Common Lit + Inbox Suite" Type="Formative &amp; Final Assessments" Date="2/6/2023" DueDate="2/10/2023" Score="22 out of 25.0000" ScoreType="Raw Score" Points="22.00 / 25.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="Where I Lived + Self-Reliance CL + Inbox" HasDropBox="false" DropStartDate="2/9/2023" DropEndDate="2/10/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1062983" Measure="Argument Essay: Stegner Quote" Type="Formative &amp; Final Assessments" Date="2/1/2023" DueDate="2/8/2023" Score="4 out of 10.0000" ScoreType="Raw Score" Points="4.00 / 10.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/9/2023" DropEndDate="2/10/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1062960" Measure="Mimetic Writing Piece" Type="Formative &amp; Final Assessments" Date="2/6/2023" DueDate="2/7/2023" Score="24 out of 25.0000" ScoreType="Raw Score" Points="24.00 / 25.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/9/2023" DropEndDate="2/10/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1062954" Measure="Nature Activities" Type="Formative &amp; Final Assessments" Date="2/2/2023" DueDate="2/3/2023" Score="9 out of 10.0000" ScoreType="Raw Score" Points="9.00 / 10.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/9/2023" DropEndDate="2/10/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1062949" Measure="Vocab 6 Kahoot" Type="Formative &amp; Final Assessments" Date="2/2/2023" DueDate="2/3/2023" Score="3 out of 3.0000" ScoreType="Raw Score" Points="3.00 / 3.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/9/2023" DropEndDate="2/10/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1062946" Measure="Vocab 6 Work" Type="Formative &amp; Final Assessments" Date="2/2/2023" DueDate="2/3/2023" Score="4 out of 5.0000" ScoreType="Raw Score" Points="4.00 / 5.0000" Notes="" TeacherID="35367" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/9/2023" DropEndDate="2/10/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                   </Assignments>
                                </Mark>
                             </Marks>
                          </Course>
                          <Course UsesRichContent="false" Period="5" Title="Draw &amp; Paint 2 (VA_501.3)" Room="118" Staff="Francesca Lee" StaffEMail="leef@bsd405.org" StaffGU="1782A177-A4D7-4494-B272-04C9587FD71E" HighlightPercentageCutOffForProgressBar="50">
                             <Marks>
                                <Mark MarkName="S2 Final" CalculatedScoreString="A" CalculatedScoreRaw="90">
                                   <StandardViews />
                                   <GradeCalculationSummary />
                                   <Assignments>
                                      <Assignment GradebookID="1126028" Measure="Project #12" Type="Assignment" Date="4/20/2023" DueDate="5/4/2023" Score="54 out of 60.0000" ScoreType="Raw Score" Points="54.00 / 60.0000" Notes="" TeacherID="80832" StudentID="35960" MeasureDescription="See on Teams" HasDropBox="false" DropStartDate="5/8/2023" DropEndDate="5/9/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1113325" Measure="Project #11" Type="Assignment" Date="3/27/2023" DueDate="4/17/2023" Score="53 out of 60.0000" ScoreType="Raw Score" Points="53.00 / 60.0000" Notes="" TeacherID="80832" StudentID="35960" MeasureDescription="See on Teams" HasDropBox="false" DropStartDate="4/19/2023" DropEndDate="4/20/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1089804" Measure="Project #10" Type="Assignment" Date="3/9/2023" DueDate="3/23/2023" Score="55 out of 60.0000" ScoreType="Raw Score" Points="55.00 / 60.0000" Notes="" TeacherID="80832" StudentID="35960" MeasureDescription="See on Teams" HasDropBox="false" DropStartDate="3/15/2023" DropEndDate="3/16/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1076593" Measure="Project #9" Type="Assignment" Date="2/15/2023" DueDate="3/8/2023" Score="56 out of 60.0000" ScoreType="Raw Score" Points="56.00 / 60.0000" Notes="" TeacherID="80832" StudentID="35960" MeasureDescription="See on Teams" HasDropBox="false" DropStartDate="2/28/2023" DropEndDate="3/1/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1071817" Measure="Project #8" Type="Assignment" Date="1/30/2023" DueDate="2/13/2023" Score="52 out of 60.0000" ScoreType="Raw Score" Points="52.00 / 60.0000" Notes="" TeacherID="80832" StudentID="35960" MeasureDescription="See on Teams" HasDropBox="false" DropStartDate="2/16/2023" DropEndDate="2/17/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                   </Assignments>
                                </Mark>
                             </Marks>
                          </Course>
                          <Course UsesRichContent="false" Period="6" Title="AP Physics 1 (SCA601.0)" Room="207" Staff="Jolyon Johnson" StaffEMail="johnsonjo@bsd405.org" StaffGU="E3C0DEC3-37F6-4DC7-A875-5AEFC22C0995" HighlightPercentageCutOffForProgressBar="50">
                             <Marks>
                                <Mark MarkName="S2 Final" CalculatedScoreString="A" CalculatedScoreRaw="92.6">
                                   <StandardViews />
                                   <GradeCalculationSummary>
                                      <AssignmentGradeCalc Type="Classwork and Quizzes" Weight="40%" Points="46.00" PointsPossible="48.00" WeightedPct="38.33%" CalculatedMark="A" />
                                      <AssignmentGradeCalc Type="Tests and Projects" Weight="60%" Points="95.00" PointsPossible="105.00" WeightedPct="54.29%" CalculatedMark="A" />
                                      <AssignmentGradeCalc Type="TOTAL" Weight="100%" Points="141.00" PointsPossible="153.00" WeightedPct="92.60%" CalculatedMark="A" />
                                   </GradeCalculationSummary>
                                   <Assignments>
                                      <Assignment GradebookID="1148824" Measure="Bridges Project" Type="Tests and Projects" Date="6/5/2023" DueDate="6/13/2023" Score="12 out of 12.0000" ScoreType="Raw Score" Points="12.00 / 12.0000" Notes="" TeacherID="11079" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="6/14/2023" DropEndDate="6/15/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1139068" Measure="Bridge Check-in" Type="Tests and Projects" Date="5/19/2023" DueDate="5/19/2023" Score="1 out of 1.0000" ScoreType="Raw Score" Points="1.00 / 1.0000" Notes="" TeacherID="11079" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/30/2023" DropEndDate="5/31/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1117655" Measure="Final Project" Type="Tests and Projects" Date="4/17/2023" DueDate="4/21/2023" Score="14 out of 14.0000" ScoreType="Raw Score" Points="14.00 / 14.0000" Notes="" TeacherID="11079" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/25/2023" DropEndDate="4/26/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1117651" Measure="Unit 7 Test" Type="Tests and Projects" Date="4/6/2023" DueDate="4/21/2023" Score="10 out of 10.0000" ScoreType="Raw Score" Points="10.00 / 10.0000" Notes="" TeacherID="11079" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="4/25/2023" DropEndDate="4/26/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1102812" Measure="Unit 6 Test" Type="Tests and Projects" Date="3/15/2023" DueDate="3/20/2023" Score="9 out of 10.0000" ScoreType="Raw Score" Points="9.00 / 10.0000" Notes="" TeacherID="11079" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/30/2023" DropEndDate="3/31/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1103237" Measure="Simple Harmonic Motion Lab" Type="Classwork and Quizzes" Date="3/10/2023" DueDate="3/17/2023" Score="15 out of 15.0000" ScoreType="Raw Score" Points="15.00 / 15.0000" Notes="" TeacherID="11079" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/30/2023" DropEndDate="3/31/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1092460" Measure="Unit 5 Test" Type="Tests and Projects" Date="3/7/2023" DueDate="3/8/2023" Score="17 out of 21.0000" ScoreType="Raw Score" Points="17.00 / 21.0000" Notes="" TeacherID="11079" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/20/2023" DropEndDate="3/21/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1081650" Measure="Collision Simulator" Type="Classwork and Quizzes" Date="2/27/2023" DueDate="3/3/2023" Score="12 out of 12.0000" ScoreType="Raw Score" Points="12.00 / 12.0000" Notes="" TeacherID="11079" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/6/2023" DropEndDate="3/7/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1081657" Measure="DART Mission" Type="Classwork and Quizzes" Date="2/16/2023" DueDate="2/28/2023" Score="10 out of 10.0000" ScoreType="Raw Score" Points="10.00 / 10.0000" Notes="" TeacherID="11079" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/6/2023" DropEndDate="3/7/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1081692" Measure="Exoplanet Project" Type="Tests and Projects" Date="2/6/2023" DueDate="2/17/2023" Score="12 out of 12.0000" ScoreType="Raw Score" Points="12.00 / 12.0000" Notes="" TeacherID="11079" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/6/2023" DropEndDate="3/7/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1070510" Measure="Unit 4 Test" Type="Tests and Projects" Date="2/10/2023" DueDate="2/13/2023" Score="20 out of 25.0000" ScoreType="Raw Score" Points="20.00 / 25.0000" Notes="" TeacherID="11079" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/15/2023" DropEndDate="2/16/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1057019" Measure="Kepler and Newton Quiz" Type="Classwork and Quizzes" Date="1/24/2023" DueDate="2/3/2023" Score="9 out of 11.0000" ScoreType="Raw Score" Points="9.00 / 11.0000" Notes="" TeacherID="11079" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="2/6/2023" DropEndDate="2/7/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                   </Assignments>
                                </Mark>
                             </Marks>
                          </Course>
                          <Course UsesRichContent="false" Period="7" Title="Pre-Calculus (MA_601.0)" Room="111" Staff="David Bennett" StaffEMail="bennettd@bsd405.org" StaffGU="284E22F5-84DF-4BC1-92A5-68ACAE283309" HighlightPercentageCutOffForProgressBar="50">
                             <Marks>
                                <Mark MarkName="S2 Final" CalculatedScoreString="B" CalculatedScoreRaw="87">
                                   <StandardViews />
                                   <GradeCalculationSummary>
                                      <AssignmentGradeCalc Type="Assessments" Weight="80%" Points="127.00" PointsPossible="152.00" WeightedPct="66.84%" CalculatedMark="B" />
                                      <AssignmentGradeCalc Type="Classwork" Weight="10%" Points="10.00" PointsPossible="10.00" WeightedPct="10.00%" CalculatedMark="A" />
                                      <AssignmentGradeCalc Type="Homework" Weight="10%" Points="30.00" PointsPossible="30.00" WeightedPct="10.00%" CalculatedMark="A" />
                                      <AssignmentGradeCalc Type="TOTAL" Weight="100%" Points="167.00" PointsPossible="192.00" WeightedPct="87.00%" CalculatedMark="B" />
                                   </GradeCalculationSummary>
                                   <Assignments>
                                      <Assignment GradebookID="1127736" Measure="Quiz: Ellipse Hyperbola Parabol" Type="Assessments" Date="6/14/2023" DueDate="6/14/2023" Score="Not Graded" ScoreType="Raw Score" Points="20.0000 Points Possible" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/10/2023" DropEndDate="5/11/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1127733" Measure="HW: Hyperbola" Type="Homework" Date="6/8/2023" DueDate="6/12/2023" Score="Not Graded" ScoreType="Raw Score" Points="5.0000 Points Possible" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/10/2023" DropEndDate="5/11/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1127724" Measure="Quiz: Circles" Type="Assessments" Date="6/1/2023" DueDate="6/1/2023" Score="17 out of 20.0000" ScoreType="Raw Score" Points="17.00 / 20.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/10/2023" DropEndDate="5/11/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1127722" Measure="HW: Circles" Type="Homework" Date="5/15/2023" DueDate="5/31/2023" Score="Not Graded" ScoreType="Raw Score" Points="5.0000 Points Possible" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/10/2023" DropEndDate="5/11/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1127728" Measure="HW: Ellipse" Type="Classwork" Date="5/29/2023" DueDate="5/29/2023" Score="Not Graded" ScoreType="Raw Score" Points="5.0000 Points Possible" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/10/2023" DropEndDate="5/11/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1125715" Measure="HW: 6.3 " Type="Homework" Date="4/24/2023" DueDate="5/1/2023" Score="5 out of 5.0000" ScoreType="Raw Score" Points="5.00 / 5.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="Polar coordinates and equations" HasDropBox="false" DropStartDate="5/8/2023" DropEndDate="5/9/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1125731" Measure="HW: 6.4" Type="Homework" Date="4/24/2023" DueDate="5/1/2023" Score="5 out of 5.0000" ScoreType="Raw Score" Points="5.00 / 5.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="Graphing Polar" HasDropBox="false" DropStartDate="5/8/2023" DropEndDate="5/9/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1121676" Measure="Quiz: Polar Coordinates and Equations" Type="Assessments" Date="5/1/2023" DueDate="5/1/2023" Score="14.5 out of 19.0000" ScoreType="Raw Score" Points="14.50 / 19.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="6.3" HasDropBox="false" DropStartDate="5/1/2023" DropEndDate="5/2/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1121849" Measure="Quiz: Polar Graphs" Type="Assessments" Date="5/1/2023" DueDate="5/1/2023" Score="18 out of 20.0000" ScoreType="Raw Score" Points="18.00 / 20.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="5/1/2023" DropEndDate="5/2/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1112104" Measure="Quiz: Law of Sines and Cosines" Type="Assessments" Date="4/17/2023" DueDate="4/17/2023" Score="13.75 out of 14.0000" ScoreType="Raw Score" Points="13.75 / 14.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="6.1 &amp;amp; 6.2" HasDropBox="false" DropStartDate="4/18/2023" DropEndDate="4/19/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1120816" Measure="CW: 6.1 &amp;amp; 6.2" Type="Classwork" Date="4/6/2023" DueDate="4/6/2023" Score="5 out of 5.0000" ScoreType="Raw Score" Points="5.00 / 5.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="Law of Sines and Law of Cosines" HasDropBox="false" DropStartDate="4/28/2023" DropEndDate="4/29/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1103337" Measure="HW: 5.5" Type="Homework" Date="3/23/2023" DueDate="3/30/2023" Score="5 out of 5.0000" ScoreType="Raw Score" Points="5.00 / 5.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="Solving Trig Equations" HasDropBox="false" DropStartDate="3/30/2023" DropEndDate="3/31/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1100512" Measure="Quiz: Trig Identities &amp;amp; Solving" Type="Assessments" Date="3/30/2023" DueDate="3/30/2023" Score="5 out of 5.0000" ScoreType="Raw Score" Points="5.00 / 5.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="5.3 &amp;amp; 5.5" HasDropBox="false" DropStartDate="3/27/2023" DropEndDate="3/28/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1100508" Measure="Quiz: Trig Identities" Type="Assessments" Date="3/27/2023" DueDate="3/27/2023" Score="10 out of 18.0000" ScoreType="Raw Score" Points="10.00 / 18.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="5.1 &amp;amp; 5.2" HasDropBox="false" DropStartDate="3/27/2023" DropEndDate="3/28/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1095293" Measure="HW: 5.3" Type="Homework" Date="3/20/2023" DueDate="3/23/2023" Score="5 out of 5.0000" ScoreType="Raw Score" Points="5.00 / 5.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="10 problems" HasDropBox="false" DropStartDate="3/22/2023" DropEndDate="3/23/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1095277" Measure="CW: Study/Review " Type="Classwork" Date="3/22/2023" DueDate="3/22/2023" Score="5 out of 5.0000" ScoreType="Raw Score" Points="5.00 / 5.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="Taking care of business, 5.1-5.3, SAT for juniors. " HasDropBox="false" DropStartDate="3/22/2023" DropEndDate="3/23/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1095289" Measure="HW: 5.2" Type="Homework" Date="3/16/2023" DueDate="3/20/2023" Score="5 out of 5.0000" ScoreType="Raw Score" Points="5.00 / 5.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="10 problems" HasDropBox="false" DropStartDate="3/22/2023" DropEndDate="3/23/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1095283" Measure="HW: 5.1" Type="Homework" Date="3/13/2023" DueDate="3/16/2023" Score="5 out of 5.0000" ScoreType="Raw Score" Points="5.00 / 5.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="10 problems" HasDropBox="false" DropStartDate="3/22/2023" DropEndDate="3/23/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1100500" Measure="Quiz: Graphing Inverse Trig" Type="Assessments" Date="3/6/2023" DueDate="3/6/2023" Score="9 out of 10.0000" ScoreType="Raw Score" Points="9.00 / 10.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/27/2023" DropEndDate="3/28/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1100505" Measure="Quiz: Trig Applications 3" Type="Assessments" Date="3/6/2023" DueDate="3/6/2023" Score="10 out of 12.0000" ScoreType="Raw Score" Points="10.00 / 12.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="" HasDropBox="false" DropStartDate="3/27/2023" DropEndDate="3/28/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1079635" Measure="Quiz: Inverse Trig Basics" Type="Assessments" Date="3/2/2023" DueDate="3/2/2023" Score="10 out of 12.0000" ScoreType="Raw Score" Points="10.00 / 12.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription=".5 each question." HasDropBox="false" DropStartDate="3/3/2023" DropEndDate="3/4/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1079628" Measure="Quiz: Graphing Trig" Type="Assessments" Date="2/16/2023" DueDate="2/16/2023" Score="11.75 out of 12.0000" ScoreType="Raw Score" Points="11.75 / 12.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="All six trig function and transformations:&#xD;&#xA;Each worth .25 points (amplitude, mid-line, period, phase shift, chunks, shape)" HasDropBox="false" DropStartDate="3/3/2023" DropEndDate="3/4/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                      <Assignment GradebookID="1079631" Measure="Quiz: Trig Applications 2" Type="Assessments" Date="2/16/2023" DueDate="2/16/2023" Score="8 out of 10.0000" ScoreType="Raw Score" Points="8.00 / 10.0000" Notes="" TeacherID="3512" StudentID="35960" MeasureDescription="Linear Speed &amp;amp; Angular Speed" HasDropBox="false" DropStartDate="3/3/2023" DropEndDate="3/4/2023">
                                         <Resources />
                                         <Standards />
                                      </Assignment>
                                   </Assignments>
                                </Mark>
                             </Marks>
                          </Course>
                          <Course UsesRichContent="false" Period="9" Title="Intl Focus Week (CT_490.3)" Room="113" Staff="Joseph Kheriaty" StaffEMail="kheriatyj@bsd405.org" StaffGU="9952E8B7-EA23-4D9E-88AB-71F4225A3906" HighlightPercentageCutOffForProgressBar="70">
                             <Marks>
                                <Mark MarkName="S2 Final" CalculatedScoreString="N/A" CalculatedScoreRaw="0.0">
                                   <StandardViews />
                                   <GradeCalculationSummary />
                                   <Assignments />
                                </Mark>
                             </Marks>
                          </Course>
                       </Courses>
                    </Gradebook>
""";
    // print(response.data['d'].toString().replaceAll('\r\n', ''));
    // var xml = XmlDocument.parse(response.data['d'].toString().replaceAll('\r\n', ''));
    var xmlOffline =  XmlDocument.parse(response_offline);

    final gradeBook = GradeBook.fromXmlElement(xmlOffline.rootElement);
    final newGradeBook = populateScores(gradeBook);
    return newGradeBook;
  }
}
