import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/commons/global_cubits/internet_checking_cubit.dart';
import '../../../../core/database/api/api_keys.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<InternetCheckingCubit, InternetCheckingState>(
          builder: (context, state) {
            if (state is InternetIsConnectedState)
            {
              return Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: CacheHelper().getData(key: ApiKeys.profilePic) != null ?
                    DecorationImage(
                        image: CachedNetworkImageProvider(
                            CacheHelper().getData(key: ApiKeys.profilePic)
                        ), fit: BoxFit.fill) :
                    DecorationImage(
                        image: AssetImage(ImageConstants.userDefaultImage),
                        fit: BoxFit.fill)

                ),
              );
            }
            else
            {
              return Shimmer.fromColors(
                baseColor: AppColors.white,
                highlightColor: AppColors.cD1D8E0,
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(ImageConstants.userDefaultImage),
                          fit: BoxFit.fill)
                  ),
                ),
              );
            }
          },),
        SpaceWidget(width: 32,),
        Padding(
          padding: EdgeInsetsDirectional.only(end: 55.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(CacheHelper().getData(key: ApiKeys.name),
                style: AppTextStyles.bold20(context).copyWith(
                    color: AppColors.c32343E),),
              SpaceWidget(height: 8,),
              Text('I love fast food',
                style: AppTextStyles.regular14(context).copyWith(
                    color: AppColors.cA0A5BA),),
            ],
          ),
        )
      ],
    );
  }
}