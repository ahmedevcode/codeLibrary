import 'package:codelibrary/core/shimmer/shimmer_container_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerSimilarBooksListView extends StatelessWidget {
  const ShimmerSimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => const AspectRatio(
          aspectRatio: 2.7 / 4,
          child: ShimmerContainerEffect(),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 10.0.w),
      ),
    );
  }
}
