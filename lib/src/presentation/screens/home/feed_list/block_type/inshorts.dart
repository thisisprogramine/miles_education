
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miles_education/src/config/constants/route_constants.dart';
import 'package:miles_education/src/config/constants/strings_constants.dart';
import 'package:miles_education/src/presentation/argument/youtube_argument.dart';
import 'package:miles_education/src/presentation/theme/theme_color.dart';

import '../../../../../config/constants/asset_constants.dart';
import '../../../../../config/constants/size_constants.dart';
import '../../../../../domain/entities/feed/feed_entity.dart';
import '../../../../../utilities/ui_helper.dart';
import '../../../../widget/item_divider.dart';

class Inshorts extends StatefulWidget {
  final String? heading;
  final List<PostData>? posts;
  const Inshorts({super.key, required this.posts, required this.heading});

  @override
  State<Inshorts> createState() => _InshortsState();
}

class _InshortsState extends State<Inshorts> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Column(
        children: [
          UIHelper.verticalSpaceMedium,
          ItemDivider(title: widget.heading),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.posts?.length ?? 0,
              itemBuilder: (context, index) {
              final item = widget.posts?[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteList.youtube, arguments: YoutubeArgument(
                      youtubeUrl: item?.files?.first.videoUrl ?? '',
                    title: item?.title ?? '--'
                  ));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil().screenWidth * 0.5,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Sizes.dimen_12),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_2, vertical: Sizes.dimen_2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(Sizes.dimen_12),
                              child: CachedNetworkImage(
                                imageUrl: item?.files?.first.thumbnail?.split('?').first ?? '',
                                fit: BoxFit.fill,
                                placeholder: (context, url) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
                                errorWidget: (context, url, error) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
                        child: Row(
                          children: [
                            SvgPicture.asset(AssetConstants.youtubeLogo, width: Sizes.dimen_42.w,),
                            UIHelper.horizontalSpaceMedium,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${item?.title}',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: Sizes.dimen_14),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text('${item?.likes} ${StringConstants.likes}',
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColor.grey, fontSize: Sizes.dimen_12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}


