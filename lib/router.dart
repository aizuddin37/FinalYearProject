import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justmarryapp/shared/navigation_drawer.dart';
import 'package:justmarryapp/view/homepage.dart';
import 'package:justmarryapp/view/loginpages.dart';
import 'package:justmarryapp/view/signuppage.dart';
import 'package:justmarryapp/view/success.dart';
import 'package:justmarryapp/view/weatherpage.dart';
import 'package:justmarryapp/shared/weather_binding.dart';
import 'package:justmarryapp/view/webpageKB.dart';
import 'package:justmarryapp/view/webpageKT.dart';
import 'package:justmarryapp/view/webpagejb.dart';
import 'package:justmarryapp/view/webpagepinang.dart';
import 'package:justmarryapp/view/webpageselangor.dart';


import 'view/loginpage.dart';
import 'main.dart';

class AppRouter {
  static const String initialRoute = "slide";


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'slide':
        return MaterialPageRoute(builder: (_) => HomePage());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case 'signup':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case 'success':
        return MaterialPageRoute(builder: (_) => SuccessPage());
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeView());
      // case 'websel':
      //   return MaterialPageRoute(builder: (_) => WebPageS());
      // case 'webpin':
      //   return MaterialPageRoute(builder: (_) => WebPageP());
      // case 'webjb':
      //   return MaterialPageRoute(builder: (_) => WebPageJB());
      // case 'webkt':
      //   return MaterialPageRoute(builder: (_) => WebPageKT());
      // case 'webkb':
      //   return MaterialPageRoute(builder: (_) => WebPageKB());
      // case 'app':
      //   return MaterialPageRoute(builder: (_) => App());
      case 'drawer':
        return MaterialPageRoute(builder: (_) => NavigationDrawer(

        ));


    }
  }
}
