import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../model/service.dart';


class ServiceDataProvider {

  final _baseUrl = 'http://localhost:5024';

  final http.Client httpClient;

  ServiceDataProvider({required this.httpClient});

  Future<Service> createService(Service service) async {
    
    final response = await httpClient.post(
      Uri.http(_baseUrl, '/creatework'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
       body: jsonEncode(<String, dynamic>{
        "serviceName": service.workName,
        "description": service.description,
        "category": service.category,
        "initialPrice": service.initialPrice,
        "intermediatePrice":service.initialPrice,
        "advancedPrice":service.advancedPrice,

      }),
    );

    if (response.statusCode == 200) {
      return Service.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<Service>> getServices() async {
    String baseUrl = 'http://localhost:5024/getallworks';
    try{

     final response = await http.get(Uri.http(baseUrl));
     if (response.statusCode == 200) {
       final services = jsonDecode(response.body) as List;
       return services.map((service) => Service.fromJson(service)).toList();
     } else {
       throw Exception('Failed to load courses');
     }
   }catch(e){
     print("Exception throuwn $e");
    }
    return null!;
  }

  Future<void> deleteService(int  id) async {
    String baseUrl = 'http://localhost:5024/deletework/$id';
    final http.Response response = await http.delete(Uri.http(baseUrl)
      ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete course.');
    }

  }

  Future<void> updateService(Service service) async {
    String baseUrl = 'http://localhost:5024/updatework';
    final http.Response response = await httpClient.put(Uri.http(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "serviceId":service.workId,
        "serviceName": service.workName,
        "description": service.description,
        "category": service.category,
        "initialPrice": service.initialPrice,
        "intermediatePrice":service.initialPrice,
        "advancedPrice":service.advancedPrice,

      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update course.');
    }
  }

}
