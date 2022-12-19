import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/models/access_keys.dart';
import 'package:marvel_characters/repository/marvel_characters_repository.dart';
import 'marvel_characters_state.dart';

class MarvelCharactersCubit extends Cubit<MarvelCharactersState> {
  MarvelCharactersCubit({
    required MarvelCharactersRepository marvelCharactersRepository,
  })  : _marvelCharactersRepository = marvelCharactersRepository,
        super(MarvelCharactersState.initial());

  final MarvelCharactersRepository _marvelCharactersRepository;

  void setAccessKeys(AccessKeys accessKeys) {
    emit(state.copyWith(accessKeys: accessKeys));
    loadCharacters();
  }

  Future<void> loadCharacters() async {
    final accessKeys = state.accessKeys;
    if (accessKeys == null) return;
    emit(state.copyWith(isLoading: true));
    final charactersResult =
        await _marvelCharactersRepository.retrieveListOfCharacters(
      publicKey: accessKeys.publicKey,
      privateKey: accessKeys.privateKey,
    );
    charactersResult.match(
      (failure) => emit(state.copyWith(failure: failure)),
      (characters) => emit(state.copyWith(characters: characters)),
    );

    emit(state.copyWith(isLoading: false));
  }
}
