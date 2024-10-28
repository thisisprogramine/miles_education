import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miles_education/src/presentation/miles_app.dart';

import 'src/injector.dart' as getIt;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]));

  await getIt.init();

  runApp(const MilesApp());
}