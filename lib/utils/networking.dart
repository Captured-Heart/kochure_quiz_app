// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kochure_quiz_app/app.dart';

class RequestHelper {
  static Future<dynamic> login({
    required Map map,
    required BuildContext context,
  }) async {
    var url = Uri.parse('https://dev-quiz.herokuapp.com/users');
    http.Response response = await http.post(url, body: map, headers: {
      // 'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
    });
    inspect(map);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      // pushNamed(context, QuizScreenDesktop.routeName);
      log('code: ${response.headers}');
      log('Login attempt successful $decodedData');
      return decodedData;
    } else {
      log('code: ${response.statusCode}');

      return 'failed';
    }
  }

  static Future<dynamic> submit({
    // required Map map,
    required BuildContext context,
  }) async {
    Map map = {
      "questionID": "4",
      "userID": "63762357b23a36c38c78b71e",
      "points": '28',
      "choosedOption": "1"
    };
    var url = Uri.parse('https://dev-quiz.herokuapp.com/questions/submit/');
    http.Response response = await http.post(url, body: map);
    inspect(map);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      log('code: ${response.headers}');

      log('Login attempt successful $decodedData');
      return decodedData;
    } else {
      log('code: ${response.statusCode}');
      return 'failed';
    }
  }

  static Future<dynamic> postRequest(Map map, String api) async {
    try {
      http.Response response = await http.post(Uri(), body: map);

      // String data = response.body;
      // var decodedData = jsonDecode(data);
      // print(decodedData);

      log("response.statusCode: ${response.statusCode}");

      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        print('Post request successful $decodedData'); //
        return decodedData;
      } else {
        log("response.statusCode!=200: ${response.statusCode}");

        return 'failed';
      }
    } catch (e) {
      log("Exception: ${e.toString()}");

      return 'failed';
    }
  }

  static Future<dynamic> getRequest(String api) async {
    try {
      http.Response response = await http.get(Uri());

      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);

        print('Get request successful $decodedData'); //
        return decodedData;
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }
}
