import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marvel_characters/models/access_keys.dart';
import 'package:marvel_characters/models/character.dart';
import 'package:marvel_characters/models/failure.dart';

part 'marvel_characters_state.freezed.dart';

@freezed
class MarvelCharactersState with _$MarvelCharactersState {
  const factory MarvelCharactersState({
    required bool isLoading,
    required Failure? failure,
    required List<Character>? characters,
    required AccessKeys? accessKeys,
  }) = _MarvelCharactersState;

  factory MarvelCharactersState.initial() => const MarvelCharactersState(
        characters: null,
        isLoading: false,
        failure: null,
        accessKeys: null,
      );
}
