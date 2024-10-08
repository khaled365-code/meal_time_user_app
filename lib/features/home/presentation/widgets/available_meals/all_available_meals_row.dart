

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';


class AllAvailableMeals extends StatelessWidget {
  const AllAvailableMeals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 24.w),
      child: Text('Popular Meals',
          style: AppTextStyles.regular20(context).copyWith(
              color: AppColors.c181C2E
          )),
    );
  }
}
