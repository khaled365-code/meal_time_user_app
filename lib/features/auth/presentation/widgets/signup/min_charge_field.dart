

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class MinChargeField extends StatelessWidget {
  const MinChargeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'Min Charge',
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(
            end: 24.w),
        child: CustomOutlineTextField(
          validator: (value) {
            if (value!.isEmpty)
            {
              return 'You must enter your minimum charge';
            }
            else {
              return null;
            }
          },
          controller: SignupCubit.get(context).minimumChargeController,
          hintText: 'example: 1000',
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
