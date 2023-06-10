import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = 'https://fakestoreapi.com/';

  Future<dynamic> get({required String endPoint, String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'bearer $token'});
    }
    http.Response response = await http.get(
      Uri.parse('$baseUrl$endPoint'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String endPoint,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse('$baseUrl$endPoint'),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put(
      {required String endPoint,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};

    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      headers.addAll({'Authorization': 'bearer $token'});
    }
    http.Response response = await http.put(
      Uri.parse('$baseUrl$endPoint'),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
