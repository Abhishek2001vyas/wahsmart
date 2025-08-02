import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahsmart/views/choose.dart';

import '../bindings/auth_binding.dart';
import '../views/login_screen.dart';
import '../views/signup.dart';



class RouteHelper {

  static const String initial= '/';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';




  static String getinitialRoute() => initial;
  static String getSignInRoute() => '$signIn';
  static String getSignUpRoute() => signUp;


  static List<GetPage> routes = [

    GetPage(
        name: initial,
        page: () => Choose(),

    ),
    GetPage(
        name: signIn,
        page: () => LoginScreen(),
    binding: AuthBinding()
    ),
    GetPage(name: signUp, page: () => const Signup(), binding: AuthBinding()),


  ];


}