import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marvel_characters/models/character_attribute.dart';
import 'package:marvel_characters/models/character_url.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  const factory Character({
    required int id,
    required String name,
    required String description,
    required Thumbnail thumbnail,
    required CharacterAttribute comics,
    required CharacterAttribute series,
    required CharacterAttribute stories,
    required CharacterAttribute events,
    required List<CharacterUrl> urls,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

@freezed
class Thumbnail with _$Thumbnail {
  const Thumbnail._();

  const factory Thumbnail({
    required String path,
    required String extension,
  }) = _Thumbnail;

  String get url => '$path.$extension';

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
}
