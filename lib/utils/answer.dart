class Answer {
  static List<String> answerQuestion(String questionNumber, int input){
    List<String> result = [];
    if (questionNumber == "1"){
      result = _questionOne(input);
    } else if (questionNumber == "2"){
      result = _questionTwo(input);
    } else if (questionNumber == "3"){
      result = _questionThree(input);
    } else {
      result = _questionFour(input);
    }
    return result;
  }

  static List<String> _questionOne(int input) {
    List<String> result = [];
    for (int i = 1; i <= input; i++){
      result.add(i.toString());
    }
    return result;
  }

  static List<String> _questionTwo(int input) {
    List<String> result = _questionOne(input);
    for (int i = input - 1; i >= 1; i--){
      result.add(i.toString());
    }
    return result;
  }

  static List<String> _questionThree(int input) {
    List<String> result = [];
    for (int i = 1; i <= input; i++){
      int secondNumber = i-1;
      result.add("$i$secondNumber");
    }
    return result;
  }

  static List<String> _questionFour(int input) {
    List<String> result = [];
    for (int i = 1; i <= input; i++){
      String data = i.toString();
      if (i % 5 == 0){
        data = "LIMA";
      } else if (i % 7 == 0){
        data = "TUJUH";
      }
      result.add(data);
    }
    return result;
  }
}