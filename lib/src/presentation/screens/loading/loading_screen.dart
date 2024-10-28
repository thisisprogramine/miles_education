import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/size_constants.dart';
import '../../bloc/loading/loading_cubit.dart';
import 'loading_circle.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;

  const LoadingScreen({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, showLoading) {
        return Stack(
          fit: StackFit.expand,
          children: [
            screen,
            if (showLoading)
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor.withOpacity(0.2)),
                child: Center(
                  child: LoadingCircle(
                    size: Sizes.dimen_200.w,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
