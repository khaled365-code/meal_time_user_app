


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'Description',
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(
            end: 24.w),
        child: CustomOutlineTextField(
          validator: (value) {
            if (value!.isEmpty)
            {
              return 'You must enter your brand description';
            }
            if(value.length < 20)
            {
              return 'description length must be at least 20 characters long';
            }
            else
            {
              return null;
            }
          },
          controller: SignupCubit.get(context).descriptionController,
          hintText: 'example: fast food brand',
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
