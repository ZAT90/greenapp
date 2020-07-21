import 'package:dio/dio.dart';
import 'package:greenapp/models/people.dart';
import 'dart:convert';

class ApiProvider {
  //Client client = Client();
  final _baseUrl = "https://dummy-research.firebaseio.com/data.json";
  final apiKey = 'ca6d482c6b63d05abc5dd780a764b58f';
  var dio = Dio();

  Future<People> fetchAllData() async {
    final response = await dio.get(_baseUrl);
    var jsonResponse = response.data;
    List jsondataList = jsonResponse['data'];
    List mapjsondata = jsondataList
        .map((jsdata) => {
              ...jsdata,
              'duties': jsdata['duties'].toString(),
              'employeeCode': jsdata['employeeCode'].toString()
            })
        .toList();
    Map updateJsonResponse = {...jsonResponse, 'data': mapjsondata};
    return People.fromJson(updateJsonResponse);
  }
}
