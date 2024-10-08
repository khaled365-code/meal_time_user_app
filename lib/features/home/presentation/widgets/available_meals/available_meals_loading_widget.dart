

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'grid_shimmer_meal_item.dart';

class AllAvailableMealsLoadingWidget extends StatelessWidget {
  const AllAvailableMealsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => GridShimmerMealItem(),
            itemCount: 12,
            padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 21.h,
                crossAxisSpacing: 21.w,
                mainAxisExtent: 200.h
            ),
          ),
        ],
      ),
    );
  }
}
