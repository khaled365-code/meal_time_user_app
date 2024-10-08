



import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'Phone',
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(
            end: 24.w),
        child: CustomOutlineTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'You must enter your phone number';
            }
            if(value.length < 10)
            {
              return 'phone length must be at least 10 characters long';
            }
            else
            {
              return null;
            }
          },
          controller: SignupCubit.get(context).phoneController,
          hintText: 'example: +201013328223',
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
