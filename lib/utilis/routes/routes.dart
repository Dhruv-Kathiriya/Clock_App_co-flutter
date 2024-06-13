import 'package:flutter/material.dart';

import '../../view/screens/fourpage/fourpage.dart';
import '../../view/screens/homepage/home_page.dart';
import '../../view/screens/secondpage/secondpage.dart';
import '../../view/screens/thairdpage/thairdpage.dart';

class Routes {
  static String homePage = '/';
  static String secondPage = 'secondPage';
  static String thirdPage = 'thirdPage';
  static String fourPage = 'fourPage';

  static Map<String, WidgetBuilder> myRoutes = {
    homePage: (context) => const HomePage(),
    secondPage: (context) => const SecondPage(),
    thirdPage: (context) => const ThairdPage(),
    fourPage: (context) => const FourPage(),
  };
}
