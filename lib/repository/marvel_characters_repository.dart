import 'package:fpdart/fpdart.dart';
import 'package:marvel_characters/models/character.dart';
import 'package:marvel_characters/models/failure.dart';

abstract class MarvelCharactersRepository {
  Future<Either<Failure, List<Character>>> retrieveListOfCharacters({
    required String publicKey,
    required String privateKey,
  });
}
