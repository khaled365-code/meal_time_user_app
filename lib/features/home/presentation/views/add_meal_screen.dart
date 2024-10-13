import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/commons/global_models/local_notifications_model.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/utils/services/local_notifications_service.dart';
import '../../../../core/widgets/no_internet_connection_dialog.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../../profile/presentation/cubits/notifications_cubit/notifications_cubit.dart';
import '../cubits/add_meal_cubit/add_meal_cubit.dart';
import '../widgets/add_meal/add_category.dart';
import '../widgets/add_meal/add_description.dart';
import '../widgets/add_meal/add_name.dart';
import '../widgets/add_meal/add_price.dart';
import '../widgets/add_meal/number_radio_button.dart';
import '../widgets/add_meal/quantity_radio_button.dart';
import '../widgets/add_meal_photo_widget.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
        return BlocListener<AddMealCubit, AddMealState>(
        listener: (context, state) {
       {
         handleListenerFunctions(state, context);
    }
  }, child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
              child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                        child: BlocBuilder<AddMealCubit,AddMealState>(
                        builder: (context, state) {
                        return Form(
                          key: AddMealCubit.get(context).addMealFormKey,
                          autovalidateMode: AddMealCubit.get(context).addMealValidateMode,
                          child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SpaceWidget(height: 32,),
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
                                   child: isArabic()==false?
                                   Center(
                                     child: SvgPicture.asset(
                                         width: 8,
                                         ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(AppColors.c181C2E, BlendMode.srcIn)),
                                   ):
                                   Center(
                                     child: Transform.rotate(
                                       angle: 3.14159,
                                       child: SvgPicture.asset(
                                           width: 8,
                                           ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(AppColors.c181C2E, BlendMode.srcIn)),
                                     ),
                                   ),
                                 ),
                               ),
                               SpaceWidget(height: 24,),
                               AddMealPhotoWidget(
                                 onDeletePhotoPressed: ()
                                 {
                                   AddMealCubit.get(context).deleteMealPhoto();
                                 },
                                 imagePath: AddMealCubit.get(context).mealImage?.path,
                                 onCameraTap: ()
                                 {
                                   imagePick(imageSource: ImageSource.camera).then(
                                         (value) => AddMealCubit.get(context).addMealPhoto(image: value!),
                                   );
                                   Navigator.pop(context);
                                 },
                                 onGalleryTap: ()
                                 {
                                   imagePick(imageSource: ImageSource.gallery).then(
                                         (value) => AddMealCubit.get(context).addMealPhoto(image: value!),
                                   );
                                   Navigator.pop(context);

                                 },
                               ),
                               SpaceWidget(height: AddMealCubit.get(context).mealImage == null ? 24 : 5,),
                               AddMealNameTextField(),
                               SpaceWidget(height: 24,),
                               AddMealPriceTextField(),
                               SpaceWidget(height: 24,),
                               AddMealDiscTextField(),
                               SpaceWidget(height: 24,),
                               AddMealCategoryWidget(),
                               SpaceWidget(height: 24,),
                               Row(
                                 children: [
                                   NumberRadioButton(),
                                   Spacer(),
                                   QuantityRadioButton()

                                 ],
                               ),
                            Expanded(
                              child: SizedBox(
                                height: 121.h,
                              ),
                            ),
                            state is AddMealLoadingState?
                               Center(
                                 child: SharedLoadingIndicator(),
                               ):
                               SharedButton(
                                 btnText: 'addMeal'.tr(context),
                                 btnTextStyle: AppTextStyles.bold16(context).copyWith(
                                     color: AppColors.white
                                 ),
                                 onPressed: ()
                                 {
                                   handleAddMealPress(context);

                                 },),
                               SpaceWidget(height: 30,)

                             ],
                           ),
                        );
                  },
                ),),),],
              ),),
        ),
);
  }

  void handleAddMealPress(BuildContext context) async
  {
    if(await InternetConnectionCheckingService.checkInternetConnection()==true)
      {
        if (AddMealCubit.get(context).addMealFormKey.currentState!.validate())
        {
          AddMealCubit.get(context).addMealFormKey.currentState!.save();
          if(AddMealCubit.get(context).mealImage==null)
          {
            showToast(
                context: context,
                msg: 'youProvideImageMeal'.tr(context),
                toastStates: ToastStates.error,
                gravity: ToastGravity.CENTER);
          }
          else
          {
            AddMealCubit.get(context).addMealFun(
              name: AddMealCubit.get(context).mealNameController.text,
              description: AddMealCubit.get(context).mealDescriptionController.text,
              price: double.parse(AddMealCubit.get(context).mealPriceController.text),
              category: AddMealCubit.get(context).selectedCategory,
              howToSell: getHowToSellValue(numberValue: AddMealCubit.get(context).numberRadioIsSelected,quantityValue: AddMealCubit.get(context).quantityRadioIsSelected),);
          }
        }
        else
          {
            AddMealCubit.get(context).activateAutoValidateMode();
          }
      }
    else
      {
        showDialog(context: context, builder: (context) => NoInternetConnectionDialog(),);
      }


  }

  void handleListenerFunctions(AddMealState state, BuildContext context) async
  {
      if(state is AddMealSuccessState)
            {
              LocalNotificationsModel localNotification = LocalNotificationsModel(
                DateTime.now().toString(),
                id: 40,
                image: ImageConstants.newMealAlarmImage,
                payload: AddMealCubit.get(context).mealImage?.path,
                title: '${AddMealCubit.get(context).mealNameController.text+'mealAddedSuccessfully'.tr(context)}',
                body: 'ThankSubmitting'.tr(context)+ ' ${AddMealCubit.get(context).mealNameController.text}'+ 'mealPending'.tr(context),
              );
              LocalNotificationsService.showBasicNotification(
                  localNotificationsModel: localNotification);
              await NotificationsCubit.get(context).saveLocalNotificationsFun(localNotification: localNotification);
            AddMealCubit.get(context).mealImage=null;
            AddMealCubit.get(context).mealNameController.clear();
            AddMealCubit.get(context).mealDescriptionController.clear();
            AddMealCubit.get(context).mealPriceController.clear();

            }
          if(state is AddMealFailureState)
          {

            if(state.errorModel.error!=null)
            {
               buildScaffoldMessenger(
                   context: context,
                   msg: state.errorModel.error!.toString().substring(1,state.errorModel.error!.toString().length-1),
                   iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,));
            }
            else
            {
                 buildScaffoldMessenger(
                     context: context,
                     msg: state.errorModel.errorMessage!,
                     iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,)
                 );
            }
          }
  }

  getHowToSellValue({required bool numberValue,required bool quantityValue})
  {
    if(numberValue==true)
    {
      return 'number';
    }
    else if(quantityValue==true)
    {
      return 'quantity';
    }
  }
}






