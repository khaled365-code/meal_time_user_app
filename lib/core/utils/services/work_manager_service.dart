


import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'local_notifications_service.dart';


class WorkManagerService
{
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
   static Workmanager workManager=Workmanager();


  static Future<void> init() async
  {
    await workManager.initialize(actionTask,isInDebugMode: true,);
    await registerTask();

  }



  static Future<void> registerTask() async
  {
    await workManager.registerPeriodicTask(
      'periodic scheduled daily notification at 12 AM ',
      'periodic scheduled notification task at 12 AM ',
      frequency: Duration(hours: 12),
    );
  }



  static Future<void> setCurrentDeviceLocation() async
  {
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
  }

  static Future<void> cancelTask({required String uniqueName}) async
  {
    await workManager.cancelByUniqueName(uniqueName);
  }

  static Future<void> cancelAllTasks() async
  {
    await workManager.cancelAll();
  }

}


@pragma('vm:entry-point')
 actionTask()
{
  Workmanager().executeTask((taskName, inputData) async
  {
    log('hello egypt');
    await LocalNotificationsService.showDailyScheduledNotification();
    return Future.value(true);
  },);
}