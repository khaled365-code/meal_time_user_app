import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../data/models/all_categories_model/all_categories_model.dart';
import '../../../data/models/carousel_slider_data_model/carousel_slider_model.dart';

part 'home_lists_state.dart';

class HomeListsCubit extends Cubit<HomeListsState> {
  HomeListsCubit() : super(HomeListsInitial());

  static HomeListsCubit get(context)=> BlocProvider.of(context);

  List<CarouselSliderModel> carouselSliderList=[
    CarouselSliderModel(textTitle: 'Become a Culinary Mastermind,Create and share your signature dishes with the app\'s community! Add mouthwatering meals with detailed descriptions, so users can discover your culinary creations.', btnText: 'See meals'),
    CarouselSliderModel(textTitle: 'Craft Your Culinary Identity: Edit and update your chef profile whenever you like. Add a captivating photo, write a compelling bio, and highlight your culinary expertise to impress the app\'s foodie community.', btnText: 'See your profile'),
  ];

  List<AllCategoriesModel> allCategoriesList=[
    AllCategoriesModel(name: 'Beef', image: ImageConstants.beefImage),
    AllCategoriesModel(name: 'Chicken', image: ImageConstants.chickenImage),
    AllCategoriesModel(name: 'Fish', image: ImageConstants.fishImage),
    AllCategoriesModel(name: 'Seafood', image: ImageConstants.seafoodImage),
    AllCategoriesModel(name: 'Pork', image: ImageConstants.porkImage),
    AllCategoriesModel(name: 'Lamb', image: ImageConstants.lambImage),
    AllCategoriesModel(name: 'Vegetarian', image: ImageConstants.vegetarianImage),
    AllCategoriesModel(name: 'Vegan', image: ImageConstants.veganImage),
    AllCategoriesModel(name: 'Gluten-free', image: ImageConstants.glutenFreeImage),
    AllCategoriesModel(name: 'Dairy-free', image: ImageConstants.dairlyFreeImage),
    AllCategoriesModel(name: 'Breakfast', image: ImageConstants.breakfastImage),
    AllCategoriesModel(name: 'Lunch', image: ImageConstants.lunchImage),
    AllCategoriesModel(name: 'Dinner', image: ImageConstants.dinnerImage),
    AllCategoriesModel(name: 'Appetizers', image: ImageConstants.appetizaresImage),
    AllCategoriesModel(name: 'Salads', image: ImageConstants.saladsImage),
    AllCategoriesModel(name: 'Soups', image: ImageConstants.soupImage),
    AllCategoriesModel(name: 'Sandwiches', image: ImageConstants.sandwichesImage),
    AllCategoriesModel(name: 'Pasta', image: ImageConstants.pastaImage),
    AllCategoriesModel(name: 'Pizza', image: ImageConstants.pizzaImage),
    AllCategoriesModel(name: 'Rice dishes', image: ImageConstants.riceDishesImage),
    AllCategoriesModel(name: 'Stir-fries', image: ImageConstants.stirFriesImage),
    AllCategoriesModel(name: 'Curries', image: ImageConstants.curriesImage),
    AllCategoriesModel(name: 'Desserts', image: ImageConstants.dessertsImage),
    AllCategoriesModel(name: 'Baked goods', image: ImageConstants.bakedGoodsImage),
    AllCategoriesModel(name: 'Snacks', image: ImageConstants.snacksImage),

  ];

  int currentSelectedCategoryIndex=0;
  changeCurrentSelectedCategoryPosition({required int index})
  {
    currentSelectedCategoryIndex=index;
    emit(ChangeCurrentSelectedCategoryPositionState());
  }

}
