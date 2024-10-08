


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

class AllCategoriesRow extends StatelessWidget {
  const AllCategoriesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: 24.w, end: 24.w),
      child: Row(
        children: [
          Text('allCategories'.tr(context), style: AppTextStyles.regular18(
              context).copyWith(color: AppColors.c32343E),),
          Spacer(),
          Text('See All', style: AppTextStyles.regular16(
              context).copyWith(color: AppColors.c333333),),
          SpaceWidget(width: 10,),
          SvgPicture.asset(ImageConstants.seeAllNextIcon)
        ],
      ),
    );
  }
}
