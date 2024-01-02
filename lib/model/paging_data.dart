import 'package:json_annotation/json_annotation.dart';

part 'paging_data.g.dart';

@JsonSerializable(
  explicitToJson: true,
  genericArgumentFactories: true,
)
class PagingData<T> {
  const PagingData({
    required this.values,
    required this.total,
  });

  factory PagingData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PagingDataFromJson<T>(
        json,
        fromJsonT,
      );

  @JsonKey(name: 'values')
  final List<T> values;

  final int total;

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$PagingDataToJson(
        this,
        toJsonT,
      );
}
