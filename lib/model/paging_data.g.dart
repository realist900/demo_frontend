// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagingData<T> _$PagingDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PagingData<T>(
      values: (json['values'] as List<dynamic>).map(fromJsonT).toList(),
      total: json['total'] as int,
    );

Map<String, dynamic> _$PagingDataToJson<T>(
  PagingData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'values': instance.values.map(toJsonT).toList(),
      'total': instance.total,
    };
