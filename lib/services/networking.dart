import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String _url;

  NetworkHelper(this._url);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
