

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_education/src/config/constants/asset_constants.dart';
import 'package:miles_education/src/config/constants/strings_constants.dart';
import 'package:miles_education/src/config/extensions/size_extensions.dart';
import 'package:miles_education/src/utilities/ui_helper.dart';

import '../../config/constants/size_constants.dart';
import '../theme/theme_color.dart';

class CircularProgressWidget extends StatelessWidget {
  const CircularProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UIHelper.verticalSpaceMedium,
          SizedBox(
            width: ScreenUtil().screenWidth * 0.60,
            height: ScreenUtil().screenWidth * 0.60,
            child: const FlareActor(AssetConstants.loadingCircle,
              animation: 'load',
              snapToEnd: true,
              color: AppColor.primary,
            ),
          ),
          Text(StringConstants.loading, style: Theme.of(context).textTheme.titleSmall,)
        ],
      ),
    );
  }
}
