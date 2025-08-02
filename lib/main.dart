import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:wahsmart/routes/route.dart';
import 'package:wahsmart/theme/light_theme.dart';
import 'package:wahsmart/views/login_screen.dart';

import 'data/repositories/auth_repo.dart';
import 'data/services/api_client.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
      theme: light,
      initialRoute: RouteHelper.getinitialRoute(),
      getPages: RouteHelper.routes,
      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 500),
     // home:  LoginScreen(),
    );
  }
}


