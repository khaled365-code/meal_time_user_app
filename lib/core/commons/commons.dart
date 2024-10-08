


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cross_file/cross_file.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../widgets/space_widget.dart';


void navigate({required BuildContext context ,required String route, Object? arg,bool replacement=false})
{
  if(replacement==true)
    {
      Navigator.pushReplacementNamed(context,route,arguments: arg);
    }
  else
    {
      Navigator.pushNamed(context, route,arguments: arg);

    }
}
Future uploadImageToAPI(XFile image) async
{
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}


 showToast({
  required String msg,
  required ToastStates toastStates,
  ToastGravity? gravity,
 required BuildContext context})
{
  FToast().init(context);
  FToast().showToast(
      child: Container(
      padding:  EdgeInsetsDirectional.only(start: 10.w,top: 20.h,bottom: 20.h ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.r),
        color: toastStates == ToastStates.success ?
        AppColors.c39AE53 :
        toastStates==ToastStates.error?
        AppColors.cDE4553:
        AppColors.cFEC51A,
      ),
      child: Row(
        children: [
          toastStates==ToastStates.success?
           SvgPicture.asset(ImageConstants.checkCircleIcon):
          toastStates==ToastStates.error?
          SvgPicture.asset(ImageConstants.errorIcon,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),):
          SvgPicture.asset(ImageConstants.triangleWarningIcon,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),),
          SpaceWidget(width: 10.w,),
          Text(msg,
              style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'sen',
            color:AppColors.white,
          )),
        ],
      ),
    ),
   gravity: gravity??ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
  );

}

Future<XFile?> imagePick({required ImageSource imageSource}) async
{
  XFile? image =await ImagePicker().pickImage(source: imageSource);
  return image!=null? image : null;

}

enum ToastStates{success,error,warning}


buildScaffoldMessenger({required BuildContext context,required String msg,SnackBarBehavior? snackBarBehavior,Widget? iconWidget,})
{

   return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         showCloseIcon: true,
    content: Row(
      children: [
        iconWidget??SizedBox.shrink(),
         iconWidget!=null?SpaceWidget(width: 10,):SizedBox.shrink(),
        FittedBox(
          fit:BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            msg,
            style: AppTextStyles.bold15(context).copyWith(color: AppColors.white),
          ),
        ),
      ],
    ),
    elevation: 0,
    backgroundColor: AppColors.primaryColor,
    behavior: snackBarBehavior?? SnackBarBehavior.fixed,
    duration: Duration(seconds: 5),
  ));

}

String formatDate({required DateTime dateTime,bool? monthName=false})
{
  int year = dateTime.year;
  int month = dateTime.month;
  int day = dateTime.day;
  if(monthName==true)
    {
      return '$day ${getMonthName(month)} $year';
    }
  else
    {
      return '$day/$month/$year';

    }
}

String getMonthName(int month)
{
  switch(month)
  {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    default:
      return 'December';
  }
}

String formatClock(DateTime dateTime)
{
  int hour = dateTime.hour;
  int minute = dateTime.minute;
  return '$hour:$minute';
}

getAmorPm(DateTime dateTime)
{
  int hour = dateTime.hour;
  if (hour > 12) {
    return 'PM';
  } else {
    return 'AM';
  }
}

getCurrentGreetingTime()
{
  if (DateTime.now().hour < 12) {
    return 'Good Morning';
  }
  else if (DateTime.now().hour < 17) {
    return 'Good Afternoon';
  }
  else
  {
    return 'Good Evening';
  }
}

 Future<XFile> getImageXFileByUrl(String url) async
 {
   var file = await DefaultCacheManager().getSingleFile(url);
   XFile result = await XFile(file.path);
   return result;
 }

 Future<String> getImagePathFromUrl(String url) async
 {
   var file = await DefaultCacheManager().getSingleFile(url);
   return file.path;
 }