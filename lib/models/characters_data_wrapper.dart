import 'package:freezed_annotation/freezed_annotation.dart';

import 'character_data_container.dart';

part 'characters_data_wrapper.freezed.dart';
part 'characters_data_wrapper.g.dart';

@freezed
class CharactersDataWrapper with _$CharactersDataWrapper {
  const factory CharactersDataWrapper({
    required CharacterDataContainer data,
  }) = _CharactersDataWrapper;

  factory CharactersDataWrapper.fromJson(Map<String, dynamic> json) =>
      _$CharactersDataWrapperFromJson(json);
}
