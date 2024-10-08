

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/database/api/api_keys.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/fontweight_helper.dart';
import '../../../../core/widgets/space_widget.dart';
import '../widgets/certification/certification_app_bar.dart';

class CertificationScreen extends StatelessWidget {
  const CertificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.white,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpaceWidget(height: 32,),
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 24.w),
                child: CertificationAppBar(),
              ),
              Spacer(flex: 2),
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 10.w,end: 10.w),
                child: Center(
                  child: AspectRatio(
                      aspectRatio: 228/207,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(32.r),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            CacheHelper().getData(key: ApiKeys.healthCertificate),
                          ),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: Text('Certification!',style: AppTextStyles.extraBold24(context).copyWith(
                  color: AppColors.c00243C,
                  fontWeight: FontWeightHelper.bold
                ),),
              ),
              SpaceWidget(height: 10,),
              Center(
                child: Text('Here is your health certificate',style: AppTextStyles.regular17(context).copyWith(
                    color: AppColors.cA4ACAD,
                ),),
              ),
              SpaceWidget(height: 5,),
              Center(
                child: Text('enjoy our service!',style: AppTextStyles.regular17(context).copyWith(
                    color: AppColors.cA4ACAD,
                ),),
              ),
              Spacer(flex: 2,),


            ],
          )),
    );
  }
}

