import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/answer.dart';
part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState([])) {
    on<AnswerQuestion>((event, emit) => {
      emit(MainState(Answer.answerQuestion(event.questionNumber, event.input)))
    });
  }
}
