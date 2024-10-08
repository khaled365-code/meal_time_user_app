
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/update_meal_cubit/update_meal_cubit.dart';

class UpdatePriceField extends StatelessWidget {
  const UpdatePriceField({
    super.key,
    required this.updateMealCubit,
  });

  final UpdateMealCubit updateMealCubit;

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'New Price',
        childWidget: CustomOutlineTextField(
          controller: updateMealCubit.updateMealPriceController,
          hintText: 'write new meal price here',
          inputFormatters:
          [
           FilteringTextInputFormatter.digitsOnly,
          ],
          onFieldSubmitted: (value) {

          },
          keyboardType: TextInputType.number,
        ));
  }
}
