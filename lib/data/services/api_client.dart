import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';



class ApiClient{

  Future postData
      (String uri, dynamic body,)
  async {
    try {
      if (kDebugMode) {

        print('====> API Body: $body');
      }
      http.Response response = await http
          .post(
        Uri.parse(AppConstants.baseUrl + uri),
        body: jsonEncode(body),
        headers: {

  },
      );
      return response;
    } catch (e) {
      return e;
    }
  }


}
