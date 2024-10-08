


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'Password',
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(
            end: 24.w),
        child: CustomOutlineTextField(
          maxLines: 1,
          obscureText: SignupCubit.get(context).passwordSecureText,
          suffixIcon: GestureDetector(
            onTap: () {
              SignupCubit.get(context).changePasswordIconShape();
            },
            child: Icon(
              SignupCubit.get(context).passwordSuffixIcon,color: AppColors.cB4B9CA,),
          ),
          validator: (value) {
            if (value!.isEmpty)
            {
              return 'You must enter your password';
            }
            else if(SignupCubit.get(context).passwordController.text != SignupCubit.get(context).confirmPassController.text)
            {
              return 'Passwords does not match';
            }
            else
            {
              return null;
            }
          },
          controller: SignupCubit.get(context).passwordController,
          hintText: '* * * * * * * * * *',
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
