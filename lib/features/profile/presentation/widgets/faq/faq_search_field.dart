

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../cubits/faq_cubit/faq_cubit.dart';

class FaqSearchField extends StatelessWidget {
  const FaqSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOutlineTextField(
        controller: TextEditingController(),
      prefixIcon: Padding(
        padding:  EdgeInsetsDirectional.only(start: 16.w,end: 16.w),
        child: SvgPicture.asset(ImageConstants.searchLineIcon),
      ),
      contentPadding: EdgeInsetsDirectional.only(top: 9.h),
      fillColor: AppColors.cF5F5F5,
      hintText: 'Enter your keyword',
      hintStyle: AppTextStyles.regular14(context).copyWith(color: AppColors.c757575),
      borderRadius: BorderRadius.circular(8.r),
      onChanged: (value)
      {
        FaqCubit.get(context).filterMyList(searchQuery: value);
      },


    );
  }
}
