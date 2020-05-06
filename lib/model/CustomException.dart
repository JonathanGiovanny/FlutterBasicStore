class CustomException {
  final String userMessage;
  final String techMessage;
  final int errorCode;

  CustomException({this.errorCode, this.userMessage, this.techMessage});
}
