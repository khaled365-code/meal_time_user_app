
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/space_widget.dart';


class NoMealsYetWidget extends StatelessWidget {
  const NoMealsYetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
       crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Image.asset(ImageConstants.editedNoMealsImage,),
        SpaceWidget(height: 38,),
        Text('ohh sorry ! No meals yet',style: AppTextStyles.medium_28_Poppins(context).copyWith(
          color: AppColors.black
        ) ),
        SpaceWidget(height: 8,),
        Text(' App dose’t have any meals\nyet please check again later',style: AppTextStyles.regular17(context).copyWith(
          color: AppColors.cC0C0C3,
          fontFamily: 'Poppins'
        ),),
        Spacer(flex: 4,),
      ],
    );
  }
}
