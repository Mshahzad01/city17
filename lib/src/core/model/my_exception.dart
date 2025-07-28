class MyException {
  const MyException([this.message, this.code]);

  final String? message;
  final int? code;

  @override
  String toString() {
    return message ?? 'Oops! Something Went Wrong.';
  }
}
