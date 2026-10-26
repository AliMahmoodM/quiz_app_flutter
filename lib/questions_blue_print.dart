class QuestionsBluePrint {
  QuestionsBluePrint(this.questionText, this.answers);
  final String questionText;
  final List<String> answers;

  List<String> copiedListShuffled() {
    List<String> copiedList = List.of(answers);
    copiedList.shuffle();
    return copiedList;
  }
}
