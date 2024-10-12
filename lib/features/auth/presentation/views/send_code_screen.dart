
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import 'package:new_meal_time_app/core/utils/app_assets.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/forget_pass_cubit/forget_pass_cubit.dart';
import '../widgets/auth_header.dart';
import '../widgets/send_code/email_field_send_code.dart';

class ForgetPasswordSendCodeScreen extends StatelessWidget {
  const ForgetPasswordSendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPassCubit, ForgetPassState>(
      listener: (context, state)
      {
        handleForgetPassSendCodeListener(state, context, ForgetPassCubit.get(context));
      },
      child: Scaffold(
          body: SafeArea(
              child: Stack(
                clipBehavior: Clip.none,
                children:
                [
                  AuthHeaderWidget(
                    incomingContext: context,
                    hasBackButton: true,
                    title: 'forgotPassword'.tr(context),
                    subTitle: 'pleaseSignIn'.tr(context),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height *(520/812),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25.r),
                          topLeft: Radius.circular(25.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                        child: BlocBuilder<ForgetPassCubit, ForgetPassState>(
                         builder: (context, state) {
                         return Form(
                          autovalidateMode: ForgetPassCubit.get(context).sendCodeAutoValidateMode,
                          key: ForgetPassCubit.get(context).sendEmailFormKey,
                          child: Column(
                            children: [
                              SpaceWidget(height: 24,),
                              EmailFieldSendCode(),
                              SpaceWidget(height: 30,),
                              state is ForgetPassSendCodeLoadingState?
                              Center(
                                child: SharedLoadingIndicator(),
                              ):
                              SharedButton(
                                btnText: 'sendCode'.tr(context),
                                onPressed: () async
                                {
                                  if(await InternetConnectionCheckingService.checkInternetConnection()==true)
                                  {
                                    if (ForgetPassCubit.get(context).sendEmailFormKey.currentState!.validate())
                                    {
                                      ForgetPassCubit.get(context).sendEmailFormKey.currentState!.save();
                                      ForgetPassCubit.get(context).forgetPassSendCodeFun(
                                          email: ForgetPassCubit.get(context).emailForForgetPassController.text);
                                    }
                                    else
                                    {
                                      ForgetPassCubit.get(context).activateSendCodeAutoValidateMode();
                                    }
                                  }
                                  else
                                  {
                                    buildScaffoldMessenger(context: context, msg: 'youAreOffline'.tr(context),iconWidget: Icon(Icons.wifi_off,color: AppColors.white,));

                                  }

                                },
                              )
                            ],
                          ),
                        );
  },
),
                      ),
                    ),
                  )


                ],
              ))

      ),
    );
  }

  void handleForgetPassSendCodeListener(ForgetPassState state, BuildContext context, ForgetPassCubit forgetPassCubit)
  {
    if (state is ForgetPassSendCodeSuccessState)
    {
      buildScaffoldMessenger(
        iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),
          context: context,
          msg: 'checkYourEmail'.tr(context));
      navigate(context: context,
          route: Routes.forgetPassChangeScreen,
          arg: forgetPassCubit.emailForForgetPassController.text);
    }
    if (state is ForgetPassSendCodeFailureState) 
    {
      if (state.errorModel.error != null)
      {
        buildScaffoldMessenger(
            iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,),
            context: context,
            msg: state.errorModel.error!.toString().substring(
                1, state.errorModel.error!.toString().length - 1));
      }
      else
      {
        buildScaffoldMessenger(
            iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,),
            context: context,
            msg: state.errorModel.errorMessage!);
      }
    }
  }
}

