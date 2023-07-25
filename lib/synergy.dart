import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'Serialization/DeserializeXml.dart';
import 'package:xml/xml.dart';

class Synergy {
  static Future<GradeBook?> login(username, password) async {
    final dio = Dio();
    var response = await dio.post('https://wa-bsd405-psv.edupoint.com/Service/PXPCommunication.asmx/ProcessWebServiceRequest', data: {
      'userID': username,
      'password': password,
      'skipLoginLog': true,
      'parent': false,
      'webServiceHandleName': 'PXPWebServices',
      'methodName': 'Gradebook',
      'paramStr': '<Parms><ChildIntID>0</ChildIntID><ReportPeriod>3</ReportPeriod></Parms>'
    });

    if (response.data['d'].length < 1000) {
      return null;
    }

    var xml = XmlDocument.parse(response.data['d'].toString().replaceAll('\r\n', ''));

    final gradeBook = GradeBook.fromXmlElement(xml.rootElement);
    return gradeBook;
  }
}