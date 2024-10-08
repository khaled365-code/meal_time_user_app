


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/edit_profile_cubit/edit_profile_cubit.dart';

class EditProfileMinChargeField extends StatelessWidget {
  const EditProfileMinChargeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'Min Charge'.toUpperCase(),
        childWidget: CustomOutlineTextField(
          controller: EditProfileCubit.get(context).minChargeController,
          keyboardType: TextInputType.number,
          maxLines: 1,
          inputFormatters:
          [
            FilteringTextInputFormatter.digitsOnly
          ],
          validator: (value)
          {if(value!.isEmpty)
            {
              return 'min charge must not be empty';
            }
            else
            {
              return null;
            }
          },
        ));
  }
}
