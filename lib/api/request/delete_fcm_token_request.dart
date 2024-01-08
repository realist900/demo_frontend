import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_fcm_token_request.freezed.dart';
part 'delete_fcm_token_request.g.dart';

@freezed
class DeleteFcmTokenRequest with _$DeleteFcmTokenRequest {
  const DeleteFcmTokenRequest._();

  const factory DeleteFcmTokenRequest({
    @JsonKey(name: 'device_uid') @Default('') String deviceId,
  }) = _DeleteFcmTokenRequest;

  factory DeleteFcmTokenRequest.fromJson(Map<String, dynamic> json) => _$DeleteFcmTokenRequestFromJson(json);
}
