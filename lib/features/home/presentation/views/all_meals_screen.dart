import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/get_system_meals_cubit/system_meals_cubit.dart';
import '../widgets/available_meals/all_available_meals_row.dart';
import '../widgets/available_meals/all_meal_app_bar.dart';
import '../widgets/available_meals/available_meals_loading_widget.dart';
import '../widgets/available_meals/grid_meal_item.dart';
import '../widgets/available_meals/no_meals_yet_widget.dart';



class AllMealsScreen extends StatelessWidget
{
  const AllMealsScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async
            {
              if(await InternetConnectionCheckingService.checkInternetConnection()==true)
                {
                 await SystemMealsCubit.get(context).getAllMealsFromApiFun();
                 buildScaffoldMessenger(context: context, msg: 'mealsFetchedSuccessfully'.tr(context),iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),);

                }
              else
                {
                  buildScaffoldMessenger(context: context, msg: 'youAreOffline'.tr(context),iconWidget: Icon(Icons.wifi_off,color: AppColors.white,));
                }
            },
            color: AppColors.primaryColor,
            edgeOffset: 1,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      SpaceWidget(height: 32,),
                      AllMealsAppBar(),
                      SpaceWidget(height: 24,),

                    ],
                  ),
                ),
                BlocBuilder<SystemMealsCubit, SystemMealsState>(
                    builder: (context, state)
                    {
                      if (state is GetAllMealsLoadingState)
                      {
                        return AllAvailableMealsLoadingWidget();
                      }
                      else if (state is GetAllMealsSuccessState
                          && SystemMealsCubit.get(context).allMealsModel?.meals != null)
                      {

                        return SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AllAvailableMealsText(),
                              SpaceWidget(height: 24,),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 21,
                                    crossAxisSpacing: 21,
                                    childAspectRatio: 153/172
                                ),
                                itemCount: SystemMealsCubit.get(context)
                                    .allMealsModel!
                                    .meals!
                                    .length,
                                itemBuilder: (context, index)
                                {
                                  return GestureDetector(
                                    onTap: () {
                                      navigate(context: context,
                                          route: Routes.mealDetailsScreen,
                                          arg: SystemMealsCubit
                                              .get(context)
                                              .allMealsModel!
                                              .meals![index]);
                                    },
                                    child: GridMealItem(
                                      index: index,
                                      mealsList: SystemMealsCubit.get(context).allMealsModel!.meals!,
                                      meal: SystemMealsCubit
                                          .get(context)
                                          .allMealsModel!
                                          .meals![index],
                                    ),
                                  );
                                },
                              
                              ),
                            ],
                          ),
                        );
                      }
                      else if (state is GetCachedMealsSuccessState
                          && SystemMealsCubit.get(context).cachedSystemMeals != null)
                      {
                        return SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AllAvailableMealsText(),
                              SpaceWidget(height: 24,),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 21,
                                    crossAxisSpacing: 21,
                                    childAspectRatio: 153/172
                                ),
                                itemCount: SystemMealsCubit
                                    .get(context)
                                    .cachedSystemMeals!
                                    .length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      navigate(context: context,
                                          route: Routes.mealDetailsScreen,
                                          arg: SystemMealsCubit
                                              .get(context)
                                              .cachedSystemMeals![index]);
                                    },
                                    child: GridMealItem(
                                      index: index,
                                      mealsList: SystemMealsCubit
                                          .get(context)
                                          .cachedSystemMeals!,
                                      meal: SystemMealsCubit
                                          .get(context)
                                          .cachedSystemMeals![index],
                                    ),
                                  );
                                },

                              ),
                            ],
                          ),
                        );
                      }
                      else if (state is GetCachedMealsFailureState)
                      {
                        return SliverFillRemaining(
                            hasScrollBody: false,
                            child: NoMealsYetWidget());
                      }
                      else if (state is GetAllMealsSuccessState &&
                          SystemMealsCubit.get(context).allMealsModel?.meals == null)
                        {
                          return SliverFillRemaining(
                              hasScrollBody: false,
                              child: NoMealsYetWidget());
                        }
                      else
                      {
                        return AllAvailableMealsLoadingWidget();
                      }
                    }),
                SliverToBoxAdapter(child: SpaceWidget(height: 80,)),
              ],
            ),
          )),
      floatingActionButton: _buildFloatingButton(context),
    );
  }

  _buildFloatingButton(BuildContext context)
  {
    return FloatingActionButton(
        backgroundColor: AppColors.c121223,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
        onPressed: ()
        {
          navigate(context: context, route: Routes.addMealScreen);
        },
        child: Center(child: Icon(
          Icons.add, color: AppColors.white, size: 30.sp,))
    );
  }


}
