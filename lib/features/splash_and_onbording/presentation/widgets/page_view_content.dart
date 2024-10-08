

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../data/models/onboarding_data_model.dart';

class PageViewContent extends StatelessWidget {
  const PageViewContent({super.key, required this.onboardingDataModel,});

  final OnboardingDataModel onboardingDataModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 240.w,
          height: 290.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
            image: DecorationImage(image: AssetImage(onboardingDataModel.image),fit: BoxFit.contain),
          ),
        ),
        Flexible(child: SpaceWidget(height: 63,)),
        Text(onboardingDataModel.title,style: AppTextStyles.extraBold24(context).copyWith(color: Color(0xff32343E)),),
        Flexible(child: SpaceWidget(height: 18,)),
        Text(onboardingDataModel.subtitle,style: AppTextStyles.regular16(context).copyWith(color: Color(0xff646982)),)


      ],
    );
  }
}
