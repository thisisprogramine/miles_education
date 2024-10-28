
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/constants/size_constants.dart';
import '../theme/theme_color.dart';

class YoutubeAppBar extends StatefulWidget implements PreferredSizeWidget{
  final String? title;
  const YoutubeAppBar({super.key, required this.title});

  @override
  State<YoutubeAppBar> createState() => _YoutubeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _YoutubeAppBarState extends State<YoutubeAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColor.white,
              )),
          Expanded(
              child: Text(widget.title ?? '--',
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
          )

        ],
      ),
    );
  }
}
