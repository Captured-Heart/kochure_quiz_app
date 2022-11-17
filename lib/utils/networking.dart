import 'dart:convert';

import 'package:http/http.dart' as http;

var url = 'https://dev-quiz.herokuapp.com';

class RequestHelper {
  static Future<dynamic> postRequest(Map map, String api) async {
    var api = '$url/user';

    try {
      http.Response response = await http.post(Uri.parse(api), body: map);

      print("response.statusCode: ${response.statusCode}");

      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        print('Post request successful $decodedData'); //
        return decodedData;
      } else {
        print("response.statusCode!=200: ${response.statusCode}");

        return 'failed';
      }
    } catch (e) {
      print("Exception: ${e.toString()}");

      return 'failed';
    }
  }
}
