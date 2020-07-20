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
   // print('response: '+response.data.toString());
  // var data = json.decode(response.data);
  var myjson = response.data;
  List jsondata = myjson['data'];
  List mapjsondata = jsondata.map((jsdata) => {...jsdata,'duties': jsdata['duties'].toString()}).toList();
 // List mapjsondata = jsondata.map((jsdata) => {...jsdata,'duties': 'abbbc'}).toList();
  Map updatedmyjson = {...myjson,'data':mapjsondata};
  //print('object updated:'+updatedmyjson.toString());
 // print('mapped list'+mapjsondata.toString());
    // for (var data in mapjsondata) {
    //   // print('item duties: '+data['duties'].toString());
    //    if(data['duties'] is List){
         
    //      data['duties'] = '${data['duties'].toString()}';
         
    //      print('it is list'+data['duties']);
    //    }
      //  else{
      //    if(data['duties'] == ''){
      //      print('this is empty');
      //    }else{
      //      print('this is not empty');
      //    }
        
      //  }
    //}
   // print('string fromjson: '+People.fromJson(updatedmyjson).toString());
   //print('object updated 1:'+updatedmyjson.toString());
    People people = People.fromJson(updatedmyjson);
    //print('object updated 2:'+people.toString());
    //print('people'+people.code.toString());
    return People.fromJson(updatedmyjson);
  }
}
