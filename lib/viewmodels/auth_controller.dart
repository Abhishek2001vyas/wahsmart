import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahsmart/views/widget/custom_snackbar.dart';

import '../data/models/body/signup_body_model.dart';
import '../data/repositories/auth_repo.dart';
import '../data/services/api_client.dart';
import '../data/services/auth_services.dart';


class AuthController extends GetxController {

RxBool phoneoremail=true.obs;
RxBool Loading=false.obs;
final ApiService _apiService = ApiService();

Future login(phone) async {
  Loading.value = true;

  var response = await _apiService.login(phone);

  if (response.statusCode == 200) {
    showCustomSnackBar("Login Sucessfull",isError: false);

  } else {
    showCustomSnackBar("${jsonDecode(response.body)["message"]}",isError: true);

  }
  print("dfgdfg ${jsonDecode(response.body)}");
  Loading.value = false;
  update();
  return response;
}


Future registerUri(Signupbody body) async {
  Loading.value = true;

  var response = await _apiService.registerUri(body);

  if (response.statusCode == 200) {


  } else {
    showCustomSnackBar("${jsonDecode(response.body)["message"]}",isError: true);

  }
  Loading.value = false;
  update();
  return response;
}
}