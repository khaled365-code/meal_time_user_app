import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/database/api/api_keys.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';

class MealTimeApp extends StatelessWidget {
  const MealTimeApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) =>
            MaterialApp(
              // locale: context.locale,
              debugShowCheckedModeBanner: false,
              initialRoute: CacheHelper().getData(key: ApiKeys.token) != null
                  ? Routes.homeScreen
                  : Routes.splash2Screen,
              onGenerateRoute: AppRouter.generateRoutes,
            ));
  }
}