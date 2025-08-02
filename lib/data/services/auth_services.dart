import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wahsmart/utils/app_constants.dart';

import '../models/body/signup_body_model.dart';

class ApiService {
  Future login(String phone) async {
    print("dfgdf ${phone}");
    final url = Uri.parse('${AppConstants.baseUrl}${AppConstants.loginUri}');
    final response = await http.post(
      headers: {

        "Authorization"  : "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjanFtaGtna2pmbXZmbWxnemVuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIwMzY0NjMsImV4cCI6MjA2NzYxMjQ2M30.UjlaS2cu2htulX74Slq41aWeJ-AEyOC24BF9DCPaiWw"
      },
      url,
      body: jsonEncode({
        'mobile_phone': phone,
      }),
    );
    return response;
  }
  Future registerUri(Signupbody body) async {
    final url = Uri.parse('${AppConstants.baseUrl}${AppConstants.registerUri}');
    final response = await http.post(
      headers: {
     "Authorization"  : "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjanFtaGtna2pmbXZmbWxnemVuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIwMzY0NjMsImV4cCI6MjA2NzYxMjQ2M30.UjlaS2cu2htulX74Slq41aWeJ-AEyOC24BF9DCPaiWw"
      },
      url,
      body: jsonEncode(body),
    );
    print("FDgfdgf ${response.statusCode} ${jsonDecode(response.body)}");
    return response;
  }
}