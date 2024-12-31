// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageResponse _$PageResponseFromJson(Map<String, dynamic> json) => PageResponse(
      page: (json['page'] as num).toInt(),
      items: json['results'] as List<dynamic>,
      totalPages: (json['total_pages'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
    );

Map<String, dynamic> _$PageResponseToJson(PageResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.items,
    };
