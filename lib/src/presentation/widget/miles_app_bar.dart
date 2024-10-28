
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miles_education/src/config/constants/asset_constants.dart';

import '../../config/constants/size_constants.dart';
import '../theme/theme_color.dart';

class MilesAppBar extends StatefulWidget implements PreferredSizeWidget{
  const MilesAppBar({super.key});

  @override
  State<MilesAppBar> createState() => _MilesAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MilesAppBarState extends State<MilesAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: AppColor.vulcan,
      centerTitle: true,
      title: Image.asset(AssetConstants.logo,
        height: kToolbarHeight - Sizes.dimen_10.h,
      ),
      leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu_sharp,
            color: AppColor.white,
          )),
      actions: [
        IconButton(
            onPressed: () {

            },
            icon: SvgPicture.asset(AssetConstants.bell, height: Sizes.dimen_24.h,)
        )
      ],
    );
  }
}
