

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/space_widget.dart';

class HomeNoMealsYetWidget extends StatelessWidget {
  const HomeNoMealsYetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.start,
     children: [
       SpaceWidget(width: 24,),
       Image.asset(ImageConstants.orderCarImage,color: AppColors.primaryColor,),
       SpaceWidget(width: 15,),
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('No Meals yet',style: AppTextStyles.medium_22_Poppins(context).copyWith(
             color: AppColors.c333333
           ),),
           SpaceWidget(height: 5,),
           Text('Add your first meal\nto start',style: AppTextStyles.regular_14_Poppins(context).copyWith(
             color: AppColors.cA0A5BA))
         ],
       ),
     ],
    );
  }
}
