class BaseModel<T> {
  final String message;
  final T result;

  BaseModel({required this.message, required this.result});

  factory BaseModel.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return BaseModel<T>(
      message: json['message'] as String,
      result: fromJsonT(json['result']),
    );
  }
}
