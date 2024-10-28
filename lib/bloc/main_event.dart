part of 'main_bloc.dart';

abstract class MainEvent {}

class AnswerQuestion extends MainEvent {
  final String questionNumber;
  final int input;
  AnswerQuestion(this.questionNumber, this.input);
}
