import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/faq_screen_models/famous_qustions_model.dart';
import '../../../data/models/faq_screen_models/questions_and_answers_model.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

   static FaqCubit get(context) => BlocProvider.of(context);


  List<FamousQuestionsModel> famousQuestions =
  [
    FamousQuestionsModel(
        icon: ImageConstants.notificationQuestionIcon,
        questionTitle: 'Getting Started',
        questionColor: AppColors.cE2F2FF),

    FamousQuestionsModel(
        icon: ImageConstants.howToInvestIcon,
        questionTitle: 'How to Invest',
        questionColor: AppColors.cEAFFED),

    FamousQuestionsModel(
        icon: ImageConstants.notificationQuestionIcon,
        questionTitle: 'Notifications',
        questionColor: AppColors.cE2F2FF),
    
  ];


  List<QuestionsAndAnswersModel> originalQuestionsAndAnswersList =
  [

    QuestionsAndAnswersModel(question: 'Can I add my own meals to the app?',
        answer: 'Yes, you can add your own meals to the App. Go to the Meals section, press add button, fill in the details like meal name, description, price, and category, and submit'),
    QuestionsAndAnswersModel(
        question: 'What should I do if I forget password?',
        answer: 'If you forget your password, click the Forgot Password link on the login page. Enter your registered email, and a code will be sent to your email to reset your password'),
    QuestionsAndAnswersModel(
        question: 'How can I update a meal I’ve added?',
        answer: 'To update a meal, go to the Meals section, select your own meal you  want to update , and complete the process'),
    QuestionsAndAnswersModel(
        question: 'Can I change language preferences?',
        answer: 'Yes, the app supports both Arabic and English. You can switch between these languages in the app settings.'),

    QuestionsAndAnswersModel(
        question: 'Does App have a dark mode?',
        answer: 'Yes, you can enable or disable dark mode by navigating to the settings and toggling the Dark Mode option.'),

    QuestionsAndAnswersModel(
        question: 'What types of notifications\ndoes the app offer?',
        answer: 'The app provides basic, repeated, and scheduled notifications. You can manage notification settings in the app, including turning notifications on or off.'),

    QuestionsAndAnswersModel(
        question: 'How can I delete my account?',
        answer: 'If you wish to delete your account, go to the Account Settings and choose the Delete Account option. Please note that this action is permanent and cannot be undone. you will lose your account and data'),

    QuestionsAndAnswersModel(
        question: 'Can I manage location settings?',
        answer: 'Yes, you can turn location services on or off in the settings menu, giving you control over whether the app accesses your location.'),

    QuestionsAndAnswersModel(
        question: 'Can I view all meals\nadded by other chefs?',
        answer: 'Yes, you can browse through all the meals added by various chefs in the All Meals section. You can filter meals by categories like cuisine, price range, or popularity.'),

    QuestionsAndAnswersModel(
        question: 'How can I edit my profile photo?',
        answer: 'To update your profile photo, go to the Profile section, click on your current photo, and select a new image from your device.'),

    QuestionsAndAnswersModel(
        question: 'How do I log out of the app?',
        answer: 'You can log out by going to the drawer menu and selecting the Log Out option. This will securely log you out of your account.'),

    QuestionsAndAnswersModel(
        question: 'What happens to my caching data\nwhen I logout of the app?',
        answer: 'All your data will be saved and accessible only after you log back in. This will ensure that your data is not lost when you log out.'),


  ];

  List<QuestionsAndAnswersModel> filteredQuestionsAndAnswersList = [];

  void initializeList()
  {
    filteredQuestionsAndAnswersList = List.from(originalQuestionsAndAnswersList);
    emit(FaqInitial());
  }


  filterMyList({required String searchQuery})
  {
    String query = searchQuery.toLowerCase();


    if (query.isEmpty)
    {
      filteredQuestionsAndAnswersList = List.from(originalQuestionsAndAnswersList);
    }
    else
    {

      filteredQuestionsAndAnswersList = originalQuestionsAndAnswersList
          .where((element) => element.question.toLowerCase().contains(query))
          .toList();
    }

    emit(FilterMyListState());
  }

}
