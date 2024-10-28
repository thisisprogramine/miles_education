import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_education/src/config/constants/route_constants.dart';
import 'package:miles_education/src/presentation/widget/background_grid.dart';
import 'package:miles_education/src/presentation/widget/logo.dart';

class MilesAppInit extends StatefulWidget {
  const MilesAppInit({super.key});

  @override
  State<MilesAppInit> createState() => _MilesAppInitState();
}

class _MilesAppInitState extends State<MilesAppInit> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500)).then((value) {
      Navigator.of(context).pushReplacementNamed(RouteList.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Logo(
          width: ScreenUtil().screenWidth * 0.4,
        ),
      ),
    );
  }
}
