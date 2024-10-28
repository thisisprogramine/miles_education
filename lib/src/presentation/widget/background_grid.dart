
import 'package:flutter/material.dart';

import '../theme/theme_color.dart';

class BackgroundGrid extends StatelessWidget {
  final Widget child;
  const BackgroundGrid({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primary.withOpacity(0.05),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Column(
            children: List.generate(15, (index) {
                return Expanded(
                    child: Divider(thickness: 0.5, color: AppColor.grey.withOpacity(0.2),)
                );
              },
            ),
          ),
          Row(
            children: List.generate(15, (index) {
                return Expanded(
                    child: VerticalDivider(thickness: 0.5, color: AppColor.grey.withOpacity(0.2))
                );
              },
            ),
          ),
          child
        ],
      ),
    );
  }
}
