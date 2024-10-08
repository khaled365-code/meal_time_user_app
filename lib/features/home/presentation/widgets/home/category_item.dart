

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/space_widget.dart';
import '../../../data/models/all_categories_model/all_categories_model.dart';


class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.allCategoriesModel, required this.isItemSelected});

  final AllCategoriesModel allCategoriesModel;
  final bool isItemSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(39.r),
        color: isItemSelected==false?AppColors.cF3F3F3:AppColors.cFFD27C,
      ),
      child: Row(
        children: [
          SpaceWidget(width: 8,),
          Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(allCategoriesModel.image),
              ),
            ),
          ),
          SpaceWidget(width: 12),
          Text(
            allCategoriesModel.name,
            style: AppTextStyles.bold14(context).copyWith(
              color: AppColors.c32343E,
            ),
          ),
          SpaceWidget(width: 21),

        ],
      ),
    );
  }
}
