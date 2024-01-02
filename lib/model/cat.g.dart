// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatImpl _$$CatImplFromJson(Map<String, dynamic> json) => _$CatImpl(
      id: json['id'] as int? ?? 0,
      breed: json['breed'] as String? ?? '',
      picture: json['picture'] as String? ?? '',
      created: json['created'] as String? ?? '',
    );

Map<String, dynamic> _$$CatImplToJson(_$CatImpl instance) => <String, dynamic>{
      'id': instance.id,
      'breed': instance.breed,
      'picture': instance.picture,
      'created': instance.created,
    };
