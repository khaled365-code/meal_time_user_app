

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/edit_profile_cubit/edit_profile_cubit.dart';

class EditProfilePhoneField extends StatelessWidget {
  const EditProfilePhoneField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'Phone Number'.toUpperCase(),
        childWidget: CustomOutlineTextField(
          inputFormatters:
          [
            FilteringTextInputFormatter.digitsOnly,
          ],
          controller: EditProfileCubit.get(context).phoneController,
          keyboardType: TextInputType.number,
          maxLines: 1,
          validator: (value)
          {
            if(value!.isEmpty)
              {
                return 'phone must not be empty';
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
        ));
  }
}
