import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  // List<String> questions = ['quiestion1', 'question2', 'question3'];
  // List<bool> answers = [false, true, true];
  // Question q1 = Question(q: 'question1', a: false);
  // print(q1.questionAnswer);

  List<Question> _questionBank = [
    Question(q: 'question1', a: false),
    Question(q: 'question2', a: true),
    Question(q: 'question3', a: true),
  ];

  // 次の質問に移る処理
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  // 質問文のゲッター
  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  // 回答のゲッター
  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
