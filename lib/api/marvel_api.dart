import 'package:dio/dio.dart';
import 'package:marvel_characters/models/characters_data_wrapper.dart';
import 'package:retrofit/retrofit.dart';

part 'marvel_api.g.dart';

@RestApi()
abstract class MarvelApi {
  factory MarvelApi(Dio dio) = _MarvelApi;

  @GET('/characters')
  Future<CharactersDataWrapper> getCharacters({
    @Query('ts') required int timeStamp,
    @Query('apikey') required String publicKey,
    @Query('hash') required String hash,
  });
}
