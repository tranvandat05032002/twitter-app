// import 'package:json_annotation/json_annotation.dart';

// part 'base_model.g.dart';

// @JsonSerializable()
// class BaseModel <T>{
//   @JsonKey(name: "message")
//   final String message;
//   @JsonKey(name: "result")
//   final T result;
//   BaseModel({required this.message, required this.result});

//   factory BaseModel.fromJson(Map<String, dynamic> json) =>
//       _$BaseModelFromJson(json);
//   Map<String, dynamic> toJson() => _$BaseModelToJson(this);
// }

import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseModel<T> {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "result")
  final T result;

  BaseModel({required this.message, required this.result});

  factory BaseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseModelToJson(this, toJsonT);
}
