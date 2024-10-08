


import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/edit_profile_cubit/edit_profile_cubit.dart';

class EditProfileNameField extends StatelessWidget {
  const EditProfileNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'Full Name'.toUpperCase(),
        childWidget: CustomOutlineTextField(
          controller: EditProfileCubit.get(context).nameController,
          keyboardType: TextInputType.text,
          maxLines: 1,
          validator: (value)
          {
            if(value!.isEmpty)
              {
                return 'name must not be empty';
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

        ));
  }
}
