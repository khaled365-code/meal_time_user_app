


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/utils/services/internet_connection_service.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/login_cubit/login_cubit.dart';

class EmailLoginField extends StatelessWidget {
  const EmailLoginField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'email',
      childWidget: Padding(
        padding:  EdgeInsetsDirectional.only(end: 24.w),
        child: CustomOutlineTextField(
          validator: (value)
          {
            if(value!.isEmpty)
            {
              return 'youMustEmail'.tr(context);
            }
            else
            {
              return null;
            }
          },
          onFieldSubmitted: (value) async
          {
            if(await InternetConnectionCheckingService.checkInternetConnection()==true)
            {
            if(LoginCubit.get(context).loginFormKey.currentState!.validate())
            {
            LoginCubit.get(context).loginFormKey.currentState!.save();
            LoginCubit.get(context).loginFun(
            email: LoginCubit.get(context).emailController.text,
            password: LoginCubit.get(context).passwordController.text);
            }
            else
            {
            LoginCubit.get(context).changeValidateMode();
            }
            }
            else
            {
              buildScaffoldMessenger(context: context, msg: 'youAreOffline'.tr(context),iconWidget: Icon(Icons.wifi_off,color: AppColors.white,));
            }
          },
          controller: LoginCubit.get(context).emailController,
          hintText: 'example@gmail.com',
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}
