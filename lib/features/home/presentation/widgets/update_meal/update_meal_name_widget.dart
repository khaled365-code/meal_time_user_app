

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/update_meal_cubit/update_meal_cubit.dart';

class UpdateMealNameField extends StatelessWidget {
  const UpdateMealNameField({
    super.key,
    required this.updateMealCubit,
  });

  final UpdateMealCubit updateMealCubit;

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'New Name',
        childWidget: CustomOutlineTextField(
          controller: updateMealCubit.updateMealNameController,
          hintText: 'write new meal name here',
          inputFormatters: [
            LengthLimitingTextInputFormatter(30)
          ],
          onFieldSubmitted: (value)
          {

          },
          keyboardType: TextInputType.text,
        ));
  }
}
