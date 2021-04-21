import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    user = UserModel(
      name: "Daisy", 
      photoUrl: "https://avatars.githubusercontent.com/u/26805544?v=4"
    );
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    quizzes = [
      QuizModel(
        image: AppImages.blocks,
        title: "NLW 5 Flutter",
        questionAnswered: 1,
        level: Level.facil,
        questions: [
          QuestionModel(
            title: "Que cor é o céu?",
            answers: [
              AnswerModel(title: "Verde"),
              AnswerModel(title: "Azul", isRight: true),
              AnswerModel(title: "Verde"),
              AnswerModel(title: "Vermelho"),
            ]
          ),
          QuestionModel(
            title: "Que cor é o céu?",
            answers: [
              AnswerModel(title: "Verde"),
              AnswerModel(title: "Azul", isRight: true),
              AnswerModel(title: "Verde"),
              AnswerModel(title: "Vermelho"),
            ]
          ),
          QuestionModel(
            title: "Que cor é o céu?",
            answers: [
              AnswerModel(title: "Verde"),
              AnswerModel(title: "Azul", isRight: true),
              AnswerModel(title: "Verde"),
              AnswerModel(title: "Vermelho"),
            ]
          ),
        ],
      ),
    ];
    state = HomeState.success;
  }
}