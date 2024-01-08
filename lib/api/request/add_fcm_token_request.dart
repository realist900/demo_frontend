import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_fcm_token_request.freezed.dart';
part 'add_fcm_token_request.g.dart';

@freezed
class AddFcmTokenRequest with _$AddFcmTokenRequest {
  const AddFcmTokenRequest._();

  const factory AddFcmTokenRequest({
    @JsonKey(name: 'push_token') @Default('') String token,
    @JsonKey(name: 'device_uid') @Default('') String deviceId,
  }) = _AddFcmTokenRequest;

  factory AddFcmTokenRequest.fromJson(Map<String, dynamic> json) => _$AddFcmTokenRequestFromJson(json);
}
