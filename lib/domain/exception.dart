class SPMException extends Error {
  final String message;

  SPMException(this.message);

  @override
  String toString() => message;
}
