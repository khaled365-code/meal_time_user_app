

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/add_meal_cubit/add_meal_cubit.dart';

class AddMealDiscTextField extends StatelessWidget {
  const AddMealDiscTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'Meal Description',
        childWidget: CustomOutlineTextField(
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLines: null,
          maxLength: 214,

          controller: AddMealCubit.get(context).mealDescriptionController,
          hintText: 'write meal description here',
          onFieldSubmitted: (value)
          {

          },
          validator: (value) {
            if(value!.isEmpty)
            {
              return 'please enter meal description';
            }
            else
            {
              return null;
            }
          },
        ));
  }
}
