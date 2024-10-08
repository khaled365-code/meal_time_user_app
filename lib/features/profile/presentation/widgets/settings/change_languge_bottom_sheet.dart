

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/line_widget.dart';
import '../../../../../core/widgets/shared_button.dart';
import '../../../../../core/widgets/space_widget.dart';


class ChangeLanguageBottomSheet extends StatelessWidget {
  const ChangeLanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r)
             ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpaceWidget(height: 20,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: FittedBox(child: Text('Would you like to change app language',style: AppTextStyles.bold16(context).copyWith(color: AppColors.cA0A5BA),)),
                ),
                Text('To (Arabic) ?',style: AppTextStyles.bold16(context).copyWith(color: AppColors.cA0A5BA),),
                SpaceWidget(height: 10,),
                LineWidget(
                  height: 3,
                ),
                SpaceWidget(height: 20,),
                GestureDetector(
                   onTap: () async
                    {
                      // context.setLocale(Locale('ar'));
                     await CacheHelper().saveData(key: ApiKeys.appCurrentLanguage, value: 'ar');
                    },
                    child: Text('Change to Arabic (AR)',style: AppTextStyles.bold18(context).copyWith(color: AppColors.primaryColor),)),
                SpaceWidget(height: 20,),
                LineWidget(
                  height: 3,
                ),
                SpaceWidget(height: 20,),
                GestureDetector(
                    onTap: () async
                    {
                      // context.setLocale(Locale('en'));
                     await CacheHelper().saveData(key: ApiKeys.appCurrentLanguage, value: 'en');

                    },
                    child: Text('Keep English',style: AppTextStyles.bold18(context).copyWith(color: AppColors.primaryColor),)),
                SpaceWidget(height: 20,),







              ],
            ),
          ),
          SpaceWidget(height: 10,),
          SharedButton(
            btnText: 'Cancel',
            onPressed: ()
            {
              Navigator.pop(context);
            },
            btnColor: WidgetStatePropertyAll(
              AppColors.white
            ),
            borderRadiusValue: 10,
            btnSize: WidgetStatePropertyAll(
              Size(MediaQuery.sizeOf(context).width, 50.h)
            ),
            btnTextStyle: AppTextStyles.bold20(context).copyWith(
              color: AppColors.primaryColor
            ),
          ),
          SpaceWidget(height: 20,),

        ]),
    );
  }
}
