

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'Email',
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(
            end: 24.w),
        child: CustomOutlineTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'You must enter your email';
            }
            if(EmailValidator.validate(value)==false)
            {
              return 'invalid email address';
            }
            else
            {
              return null;
            }
          },
          controller: SignupCubit.get(context).emailController,
          hintText: 'example@gmail.com',
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}
