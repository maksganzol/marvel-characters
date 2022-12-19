import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel_characters/api/marvel_api.dart';
import 'package:marvel_characters/repository/marvel_characters_repository.dart';
import 'package:marvel_characters/repository/marvel_characters_repository_impl.dart';
import 'package:marvel_characters/router/router.dart';

abstract class ServiceLocator {
  static final GetIt injector = GetIt.asNewInstance();

  static void initialize() {
    injector.registerSingleton<AppRouter>(AppRouter());
    injector.registerSingleton<Dio>(_prepareDioClient());

    injector.registerSingleton<MarvelApi>(MarvelApi(injector()));

    injector.registerSingleton<MarvelCharactersRepository>(
      MarvelCharactersRepositoryImpl(marvelApi: injector()),
    );
  }

  static Dio _prepareDioClient() {
    return Dio(BaseOptions(baseUrl: 'https://gateway.marvel.com/v1/public'));
  }
}
