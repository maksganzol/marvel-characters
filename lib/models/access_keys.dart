import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_keys.freezed.dart';

@freezed
class AccessKeys with _$AccessKeys {
  const factory AccessKeys({
    required String publicKey,
    required String privateKey,
  }) = _AccessKeys;
}
