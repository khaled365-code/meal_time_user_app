

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';
import 'delete_account_bottom_sheet.dart';
import 'logout_bottom_sheet.dart';

class LogoutAndDeleteAccountContainer extends StatelessWidget {
  const LogoutAndDeleteAccountContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(20.w),
      decoration: BoxDecoration(
          color: AppColors.cF6F8FA,
          borderRadius: BorderRadius.circular(16.r)
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsetsDirectional.zero,
            onTap: ()
            {
              showModalBottomSheet(
                backgroundColor: AppColors.transparent,
                context: context, builder: (context) => DeleteAccountBottomSheet(),);
            },
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: SvgPicture.asset(ImageConstants.deleteAccountIcon,colorFilter: ColorFilter.mode(AppColors.c2AE1E1, BlendMode.srcIn),),
              ),
            ),
            title: Text('Delete Account',style: AppTextStyles.regular16(context).copyWith(color: AppColors.c32343E,)),
            trailing: SvgPicture.asset(ImageConstants.arrowNextProfileIcon),
          ),
          SpaceWidget(height: 16,),
          ListTile(
            contentPadding: EdgeInsetsDirectional.zero,
            onTap: ()
            {
              showModalBottomSheet(
                backgroundColor: AppColors.transparent,
                context: context, builder: (context) => LogoutBottomSheet(),);
            },
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: SvgPicture.asset(ImageConstants.logoutIcon,),
              ),
            ),
            title: Text('Log Out',style: AppTextStyles.regular16(context).copyWith(color: AppColors.c32343E,)),
            trailing: SvgPicture.asset(ImageConstants.arrowNextProfileIcon),
          ),

        ],
      ),
    );
  }
}