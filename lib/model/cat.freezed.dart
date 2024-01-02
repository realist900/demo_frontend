// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cat _$CatFromJson(Map<String, dynamic> json) {
  return _Cat.fromJson(json);
}

/// @nodoc
mixin _$Cat {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'breed')
  String get breed => throw _privateConstructorUsedError;
  @JsonKey(name: 'picture')
  String get picture => throw _privateConstructorUsedError;
  @JsonKey(name: 'created')
  String get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatCopyWith<Cat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatCopyWith<$Res> {
  factory $CatCopyWith(Cat value, $Res Function(Cat) then) =
      _$CatCopyWithImpl<$Res, Cat>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'breed') String breed,
      @JsonKey(name: 'picture') String picture,
      @JsonKey(name: 'created') String created});
}

/// @nodoc
class _$CatCopyWithImpl<$Res, $Val extends Cat> implements $CatCopyWith<$Res> {
  _$CatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? breed = null,
    Object? picture = null,
    Object? created = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CatImplCopyWith<$Res> implements $CatCopyWith<$Res> {
  factory _$$CatImplCopyWith(_$CatImpl value, $Res Function(_$CatImpl) then) =
      __$$CatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'breed') String breed,
      @JsonKey(name: 'picture') String picture,
      @JsonKey(name: 'created') String created});
}

/// @nodoc
class __$$CatImplCopyWithImpl<$Res> extends _$CatCopyWithImpl<$Res, _$CatImpl>
    implements _$$CatImplCopyWith<$Res> {
  __$$CatImplCopyWithImpl(_$CatImpl _value, $Res Function(_$CatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? breed = null,
    Object? picture = null,
    Object? created = null,
  }) {
    return _then(_$CatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CatImpl extends _Cat {
  const _$CatImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'breed') this.breed = '',
      @JsonKey(name: 'picture') this.picture = '',
      @JsonKey(name: 'created') this.created = ''})
      : super._();

  factory _$CatImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'breed')
  final String breed;
  @override
  @JsonKey(name: 'picture')
  final String picture;
  @override
  @JsonKey(name: 'created')
  final String created;

  @override
  String toString() {
    return 'Cat(id: $id, breed: $breed, picture: $picture, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, breed, picture, created);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatImplCopyWith<_$CatImpl> get copyWith =>
      __$$CatImplCopyWithImpl<_$CatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatImplToJson(
      this,
    );
  }
}

abstract class _Cat extends Cat {
  const factory _Cat(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'breed') final String breed,
      @JsonKey(name: 'picture') final String picture,
      @JsonKey(name: 'created') final String created}) = _$CatImpl;
  const _Cat._() : super._();

  factory _Cat.fromJson(Map<String, dynamic> json) = _$CatImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'breed')
  String get breed;
  @override
  @JsonKey(name: 'picture')
  String get picture;
  @override
  @JsonKey(name: 'created')
  String get created;
  @override
  @JsonKey(ignore: true)
  _$$CatImplCopyWith<_$CatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
