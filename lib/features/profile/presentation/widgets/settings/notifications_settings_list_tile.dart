

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../cubits/settings_cubit/settings_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class NotificationsSettingsListTile extends StatelessWidget {
  const NotificationsSettingsListTile({
    super.key,
    required this.settingsCubit,
  });

  final SettingsCubit settingsCubit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('General Notifications',style: AppTextStyles.bold15(context).copyWith(
          color: AppColors.c32343E
      ),),
      subtitle: Text('Allows us to send notifications to your device',style: AppTextStyles.regular13(context).copyWith(
          color: AppColors.cA0A5BA
      ),),
      contentPadding: EdgeInsetsDirectional.zero,
      trailing: Switch(
          value: CacheHelper().getData(key: ApiKeys.notificationIsActive)
              ?? settingsCubit.notificationIsActive,
          trackOutlineColor: WidgetStatePropertyAll(
              AppColors.cC4C4C4
          ),
          thumbIcon: WidgetStatePropertyAll(Icon(Icons.circle,color: AppColors.white,size: 31.sp,)),
          activeTrackColor: AppColors.primaryColor,
          inactiveThumbColor: AppColors.white,
          inactiveTrackColor: AppColors.cC4C4C4,
          onChanged: (value)
          {
            settingsCubit.onNotificationSwitched(value: value);
          }),
    );
  }
}
