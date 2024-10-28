import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_education/src/presentation/routes/fade_page_route_builder.dart';
import 'package:miles_education/src/presentation/routes/routes.dart';
import 'package:miles_education/src/presentation/screens/loading/loading_screen.dart';
import 'package:miles_education/src/presentation/theme/app_theme.dart';

import '../config/constants/route_constants.dart';
import '../config/constants/strings_constants.dart';
import '../injector.dart';
import 'bloc/loading/loading_cubit.dart';

class MilesApp extends StatefulWidget {
  const MilesApp({super.key});

  @override
  State<MilesApp> createState() => _MilesAppState();
}

class _MilesAppState extends State<MilesApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late LoadingCubit _loadingCubit;

  @override
  void initState() {
    super.initState();
    _loadingCubit = getItInstance<LoadingCubit>();
  }

  @override
  void dispose() {
    _loadingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoadingCubit>.value(value: _loadingCubit),
      ],
      child: ScreenUtilInit(
          designSize: const Size(414, 360),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, ctx) {
            return MaterialApp(
              navigatorKey: _navigatorKey,
              debugShowCheckedModeBanner: false,
              title: StringConstants.milesApp,
              theme: AppTheme.getAppDarkTheme(
                  context: context,
                  ),
              builder: (context, child) {
                return LoadingScreen(
                  screen: child!,
                );
              },
              initialRoute: RouteList.initial,
              onGenerateRoute: (RouteSettings settings) {
                final routes = Routes.getRoutes(settings);
                final WidgetBuilder? builder =
                routes[settings.name];
                return FadePageRouteBuilder(
                  builder: builder!,
                  settings: settings,
                );
              },
            );
          }),
    );
  }
}
