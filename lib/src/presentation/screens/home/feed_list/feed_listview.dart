
import 'package:flutter/material.dart';
import 'package:miles_education/src/presentation/screens/home/feed_list/feed_list_item.dart';

import '../../../../domain/entities/feed/feed_entity.dart';

class FeedListView extends StatefulWidget {
  final List<FeedData>? feedData;
  const FeedListView({super.key, required this.feedData});

  @override
  State<FeedListView> createState() => _FeedListViewState();
}

class _FeedListViewState extends State<FeedListView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.feedData?.length ?? 0,
          itemBuilder: (context, index) {
            final feed = widget.feedData?[index];
            return FeedListItem(feedData: feed);
          }
      ),
    );
  }
}
