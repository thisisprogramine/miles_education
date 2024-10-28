
import 'package:flutter/material.dart';
import 'package:miles_education/src/config/constants/strings_constants.dart';
import 'package:miles_education/src/presentation/screens/home/feed_list/block_type/masterclass.dart';
import 'package:miles_education/src/utilities/ui_helper.dart';
import '../../../../domain/entities/feed/feed_entity.dart';
import 'block_type/banners.dart';
import 'block_type/cta.dart';
import 'block_type/events.dart';
import 'block_type/inshorts.dart';
import 'block_type/reels.dart';

class FeedListItem extends StatefulWidget {
  final FeedData? feedData;
  const FeedListItem({super.key, required this.feedData});

  @override
  State<FeedListItem> createState() => _FeedListItemState();
}

class _FeedListItemState extends State<FeedListItem> {
  @override
  Widget build(BuildContext context) {
    if(widget.feedData?.blockType?.contains(StringConstants.banners) ?? false) {
      return Banners(posts: widget.feedData?.posts);
    }else if(widget.feedData?.blockType?.contains(StringConstants.reels) ?? false) {
      return Reels(posts: widget.feedData?.posts?.reversed.toList(), heading: widget.feedData?.heading,);
    }else if(widget.feedData?.blockType?.contains(StringConstants.cta) ?? false) {
      return Cta(posts: widget.feedData?.posts);
    }else if(widget.feedData?.blockType?.contains(StringConstants.events) ?? false) {
      return Events(posts: widget.feedData?.posts, heading: widget.feedData?.heading);
    }else if(widget.feedData?.blockType?.contains(StringConstants.inshorts) ?? false) {
      return Inshorts(posts: widget.feedData?.posts, heading: widget.feedData?.heading,);
    }else if(widget.feedData?.blockType?.contains(StringConstants.masterclass) ?? false) {
      return Masterclass(posts: widget.feedData?.posts, heading: widget.feedData?.heading,);
    }

    return const SizedBox.shrink();
  }

}
