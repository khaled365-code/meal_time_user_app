

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/space_widget.dart';

class GridShimmerMealItem extends StatelessWidget {
  const GridShimmerMealItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.c96969A,
                blurRadius: 10,
                offset: const Offset(12, 12),
                spreadRadius: 0
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 17.w,end: 14.w),
            child: Container(
              height: 84,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                    image: AssetImage(
                      ImageConstants.noImage
                    ),fit: BoxFit.cover)
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceWidget(height: 15,),
                Shimmer.fromColors(
                  baseColor: AppColors.white,
                  highlightColor: AppColors.cD1D8E0,
                  child: Container(
                    height: 15.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                ImageConstants.loadingImage
                            ),fit: BoxFit.fill)
                    ),
                  ),
                ),
                SpaceWidget(height: 5,),
                Shimmer.fromColors(
                  baseColor: AppColors.white,
                  highlightColor: AppColors.cD1D8E0,
                  child: Container(
                    height: 15.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                ImageConstants.loadingImage
                            ),fit: BoxFit.fill)
                    ),
                  ),
                ),
                SpaceWidget(height: 8,),
                Row(
                  children: [
                    Expanded(
                      child: Shimmer.fromColors(
                        baseColor: AppColors.white,
                        highlightColor: AppColors.cD1D8E0,
                        child: Container(
                          height: 20.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      ImageConstants.loadingImage
                                  ),fit: BoxFit.fill)
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Shimmer.fromColors(
                      baseColor: AppColors.white,
                      highlightColor: AppColors.cD1D8E0,
                      child: Padding(
                        padding:  EdgeInsetsDirectional.only(end: 10.w),
                        child: Container(
                          width: 30.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.favorite_outline,color: AppColors.white,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SpaceWidget(height: 15,),

              ],
            ),
          ),




        ],
      ),
    );
  }
}
