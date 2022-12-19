import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_url.freezed.dart';
part 'character_url.g.dart';

@freezed
class CharacterUrl with _$CharacterUrl {
  const factory CharacterUrl({
    required String url,
    required String type,
  }) = _CharacterUrl;

  factory CharacterUrl.fromJson(Map<String, dynamic> json) =>
      _$CharacterUrlFromJson(json);
}
