//import 'package:dio/dio.dart';

import 'dart:convert';

import '../model/work.dart';
import 'package:http/http.dart' show Client;
class WorkRepository{
  // final dio = Dio();
  // final url = 'http://localhost:5024/';

  // Future<List<Work>> fetchWorks() async{
  //   final res = await dio.get(url + 'getallworks');
  //   final list = res.data as List;

  //   List<Work> listWork = [];
  //   for(var json in list){
  //     final work = Work.fromJson(json);
  //     listWork.add(work);
  //   }

  //   return listWork;
  // }

  final String baseUrl = 'http://localhost:5024';
  Client client = Client();


  Future<List<Work>> fetchWorks() async{
    final res = await client.get(Uri.parse("$baseUrl/getallworks"));
    if(res.statusCode == 200){
      var json = jsonDecode(res.body);
      return json;
    }else {
      return null!;
    }
  }
}