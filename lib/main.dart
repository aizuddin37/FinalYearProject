

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:justmarryapp/router.dart';
import 'package:justmarryapp/shared/navigation_drawer.dart';
import 'package:justmarryapp/shared/weather_binding.dart';
import 'package:justmarryapp/view/Predict.dart';
import 'package:justmarryapp/view/PredictJohor.dart';
import 'package:justmarryapp/view/PredictKT.dart';
import 'package:justmarryapp/view/PredictKelantan.dart';
import 'package:justmarryapp/view/PredictPinang.dart';
import 'package:justmarryapp/view/chart.dart';
import 'package:justmarryapp/view/citylistpage.dart';
import 'package:justmarryapp/view/historyDisplaypage.dart';

import 'package:justmarryapp/view/loginpage.dart';
import 'package:justmarryapp/view/loginpages.dart';
import 'package:justmarryapp/view/signuppage.dart';
import 'package:justmarryapp/view/success.dart';
import 'package:justmarryapp/view/successSignup.dart';
import 'package:justmarryapp/view/visual.dart';
import 'package:justmarryapp/view/weatherpage.dart';
import 'package:justmarryapp/view/weatherpage2.dart';
import 'package:justmarryapp/view/webpageAll.dart';
import 'package:justmarryapp/view/webpageKB.dart';

import 'package:justmarryapp/view/webpageKT.dart';
import 'package:justmarryapp/view/webpagejb.dart';
import 'package:justmarryapp/view/webpageoverall.dart';
import 'package:justmarryapp/view/webpagepinang.dart';
import 'package:justmarryapp/view/webpageselangor.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      title: 'JustMarry',
      theme: ThemeData(fontFamily: "TitilliumWeb"),
      debugShowCheckedModeBanner: false,
      initialRoute: 'slide',
      getPages: [
        GetPage(
          name: 'weather',
          page: () => WeatherPage(),
          binding: WeatherBinding(),
        ),
        GetPage(
          name: 'weather2',
          page: () => WeatherPage2(),
          binding: WeatherBinding(),
        ),
        GetPage(name: 'slide', page:() => HomePage(),),
        GetPage(name: 'login', page:() => LoginPage(),),
        GetPage(name: 'signup', page:() => SignUpPage(),),
        GetPage(name: 'success', page:() => SuccessPage(),),
        GetPage(name: 'success2', page:() => SuccessPage2(),),
        GetPage(name: 'websel', page:() => WebPageS(),),
        GetPage(name: 'webpin', page:() => WebPageP(),),
        GetPage(name: 'webjb', page:() => WebPageJB(),),
        GetPage(name: 'webkt', page:() => WebPageKT(),),
        GetPage(name: 'webkb', page:() => WebPageKB(),),
        GetPage(name: 'drawer', page:() => NavigationDrawer(),),
        // GetPage(name: 'all', page:() => WebPageAll(),),
        GetPage(name: 'chart', page:() => ChartPages(),),
        GetPage(name: 'chartK', page:() => Chart2Pages(),),
        GetPage(name: 'chartJ', page:() => Chart3Pages(),),
        GetPage(name: 'chartP', page:() => Chart4Pages(),),
        GetPage(name: 'chartKT', page:() => Chart5Pages(),),
        GetPage(name: 'list', page:() => ListPage(),),
        GetPage(name: 'hist', page:() => HistoryPage(),),
        GetPage(name: 'overall', page:() => HistoriesPage(),),
        // GetPage(name: 'mea', page:() => VisualPage(),binding: WeatherBinding(),),
      ],

    );
  }
}




