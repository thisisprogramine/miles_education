
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_education/src/config/constants/asset_constants.dart';

import '../../config/constants/size_constants.dart';

class Logo extends StatelessWidget {
  final double height;
  final double? width;

  const Logo({
    Key? key,
    this.height = 20,
    this.width,
  })   : assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h, horizontal: Sizes.dimen_24.w),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetConstants.logo,
            width: width,
          )
        ],
      ),
    );
  }
}
