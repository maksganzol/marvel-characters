import 'package:freezed_annotation/freezed_annotation.dart';

import 'character.dart';

part 'character_data_container.freezed.dart';
part 'character_data_container.g.dart';

@freezed
class CharacterDataContainer with _$CharacterDataContainer {
  const factory CharacterDataContainer({
    required List<Character> results,
  }) = _CharacterDataContainer;

  factory CharacterDataContainer.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataContainerFromJson(json);
}
