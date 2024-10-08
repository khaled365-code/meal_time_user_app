

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

class DrawerAppBar extends StatelessWidget {
  const DrawerAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.cECF0F4
            ),
            child: Center(
              child: SvgPicture.asset(
                  width: 8, ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(AppColors.c181C2E, BlendMode.srcIn)),
            ),
          ),
        ),
        SpaceWidget(width: 16,),
        Text('Profile', style: AppTextStyles.regular17(
            context).copyWith(color: AppColors.c181C2E,),),
        Spacer(),
        GestureDetector(
          onTap: ()
          {

          },
          child: Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.cECF0F4
            ),
            child: Center(child: SvgPicture.asset(
                ImageConstants.points3Icon)),
          ),
        ),
      ],
    );
  }
}
