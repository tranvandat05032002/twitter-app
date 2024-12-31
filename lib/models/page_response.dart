import 'package:json_annotation/json_annotation.dart';
part 'page_response.g.dart';

@JsonSerializable()
class PageResponse {
  final int page;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;
  @JsonKey(name: "results")
  final List items;

  PageResponse({
    required this.page,
    required this.items,
    required this.totalPages,
    required this.totalResults,
  });

  factory PageResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PageResponseToJson(this);
}