
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_education/src/config/constants/size_constants.dart';

import '../../../../domain/entities/testimonials/testimonials_entity.dart';
import 'testimonials_list_item.dart';

class TestimonialsList extends StatefulWidget {
  final List<TestimonialsData>? testimonials;
  const TestimonialsList({super.key, required this.testimonials});

  @override
  State<TestimonialsList> createState() => _TestimonialsListState();
}

class _TestimonialsListState extends State<TestimonialsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.dimen_100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.testimonials?.length ?? 0,
        itemBuilder: (context, index) {
          final item = widget.testimonials?[index];
          return TestimonialsListItem(
              testimonialsData: item,
              isLastItem: (widget.testimonials?.length ?? 0) -1  == index,
          );
        },
      ),
    );
  }
}
