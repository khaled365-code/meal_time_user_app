


import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/edit_profile_cubit/edit_profile_cubit.dart';

class EditProfileBrandNameField extends StatelessWidget {
  const EditProfileBrandNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'Brand Name'.toUpperCase(),
        childWidget: CustomOutlineTextField(
          controller: EditProfileCubit.get(context).brandNameController,
          keyboardType: TextInputType.text,
          maxLines: 1,
          validator: (value) {
            if(value!.isEmpty)
              {
                return 'brand name must not be empty';
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
        ));
  }
}
