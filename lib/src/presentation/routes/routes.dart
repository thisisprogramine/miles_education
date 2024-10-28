
import 'package:flutter/material.dart';
import 'package:miles_education/src/config/constants/route_constants.dart';
import 'package:miles_education/src/presentation/screens/youtube/youtube_screen.dart';

import '../argument/youtube_argument.dart';
import '../miles_app_init.dart';
import '../screens/home/home_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (context) => const MilesAppInit(),
        RouteList.home: (context) => const HomeScreen(),
        RouteList.youtube: (context) => YoutubeScreen(argument: setting.arguments as YoutubeArgument)
      };
}
