import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/utils/services/internet_connection_service.dart';
import '../../../../../core/utils/services/push_notifications_service.dart';
import '../../../../../core/utils/services/work_manager_service.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context)=>BlocProvider.of(context);



  bool isBillReminderActive=false;

  Future<void> onBillReminderSwitched({required bool value}) async
  {
        isBillReminderActive=value;
        await CacheHelper().saveData(key: ApiKeys.billReminderIsActive, value: value);
        emit(BillReminderSwitchedState());
        if(isBillReminderActive==true)
          {
           await WorkManagerService.init();
          }
        else
          {
            WorkManagerService.cancelTask(uniqueName: 'periodic scheduled daily notification at 12 AM ');
          }

  }



  bool notificationIsActive=false;

  Future<void> onNotificationSwitched({required bool value}) async
  {
        notificationIsActive=value;
        await CacheHelper().saveData(key: ApiKeys.notificationIsActive, value: value);
        emit(NotificationSwitchedState());
        if(notificationIsActive==false)
          {

            await Future.wait([
             PushNotificationsService.disablePushNotifications(),
             PushNotificationsService.unSubscribeToTopicFun(),
            ]);
          }
        else
          {
            if (await InternetConnectionCheckingService.checkInternetConnection() == true)
            {
              await PushNotificationsService.init();
            }
          }

  }

  bool appUpdateIsActive=true;

  switchOnAppUpdatesFun({required bool value}) async
  {
    if(appUpdateIsActive==value)
      {
        return;
      }
    else
      {
        appUpdateIsActive=value;
        await CacheHelper().saveData(key: ApiKeys.appUpdateIsActive, value: value);
        emit(AppUpdatesSwitchedState());
      }

  }


}

