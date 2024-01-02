import 'package:json_annotation/json_annotation.dart';

part 'page.g.dart';

@JsonSerializable(
  explicitToJson: true,
  genericArgumentFactories: true,
)
class Page<T> {
  const Page({required this.content});

  factory Page.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PageFromJson<T>(
        json,
        fromJsonT,
      );

  @JsonKey(name: 'content')
  final List<T> content;

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) =>
      _$PageToJson(
        this,
        toJsonT,
      );
}
