

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class BrandNameField extends StatelessWidget {
  const BrandNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'Brand Name',
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(
            end: 24.w),
        child: CustomOutlineTextField(
          validator: (value) {
            if (value!.isEmpty)
            {
              return 'You must enter your brand name';
            }
            if(value.length<3)
            {
              return 'brand name length must be at least 3 characters long';
            }
            if(value.length>15)
            {
              return 'brand name length must be less than or equal to 15 characters long';
            }
            else
            {
              return null;
            }
          },
          controller: SignupCubit.get(context).brandNameController,
          hintText: 'example: ChefLegacy',
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
