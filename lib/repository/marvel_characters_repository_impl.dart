import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:marvel_characters/api/marvel_api.dart';
import 'package:marvel_characters/models/character.dart';
import 'package:marvel_characters/models/failure.dart';

import 'marvel_characters_repository.dart';

class MarvelCharactersRepositoryImpl implements MarvelCharactersRepository {
  MarvelCharactersRepositoryImpl({
    required MarvelApi marvelApi,
  }) : _marvelApi = marvelApi;

  final MarvelApi _marvelApi;

  @override
  Future<Either<Failure, List<Character>>> retrieveListOfCharacters({
    required String publicKey,
    required String privateKey,
  }) async {
    try {
      final charactersWrapper = await _marvelApi.getCharacters(
        timeStamp: _timeStamp,
        publicKey: publicKey,
        hash: _hash(_timeStamp, publicKey, privateKey),
      );
      return Right(charactersWrapper.data.results);
    } on DioError catch (e) {
      final errorData = e.response?.data;
      if (errorData == null) return Left(Failure.unknown());
      return Left(Failure.fromJson(errorData));
    }
  }

  int get _timeStamp => DateTime.now().millisecondsSinceEpoch;

  String _hash(
    int timeStamp,
    String publicKey,
    String privateKey,
  ) =>
      _generateMd5('$timeStamp$privateKey$publicKey');

  String _generateMd5(String input) =>
      md5.convert(utf8.encode(input)).toString();
}
