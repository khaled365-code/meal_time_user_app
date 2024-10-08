

import 'package:flutter/material.dart';

import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_assets.dart';

class Splash2Screen extends StatefulWidget {
  const Splash2Screen({super.key});

  @override
  State<Splash2Screen> createState() => _Splash2ScreenState();
}

class _Splash2ScreenState extends State<Splash2Screen> {

  @override
  void initState()
  {
    getDelayed(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children:
            [
              Align(
                alignment: AlignmentDirectional.topStart,
                  child: Image.asset(ImageConstants.splashTopElipsisImage,fit: BoxFit.cover,)),
              Spacer(),
              Image.asset(ImageConstants.splashLogoSmallImage,fit: BoxFit.cover,),
              Spacer(),
              Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Image.asset(ImageConstants.splashBottomElipsisImage,fit: BoxFit.cover,)),

            ],
          )),
    );
  }

  getDelayed({required BuildContext context})
  {
    Future.delayed(Duration(milliseconds: 3000),()
    {
      navigate(context: context, route: Routes.onBoardingScreen,replacement: true);
    },);

  }
}
