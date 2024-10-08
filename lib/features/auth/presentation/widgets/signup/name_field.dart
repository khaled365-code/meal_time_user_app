


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class NameField extends StatelessWidget {
  const NameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'Name',
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(end: 24.w),
        child: CustomOutlineTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'You must enter your name';
            }
            if(value.length > 20)
            {
              return 'name length must be less than or equal to 20';
            }
            else
            {
              return null;
            }
          },
          controller: SignupCubit.get(context).nameController,
          hintText: 'example: John doe',
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
