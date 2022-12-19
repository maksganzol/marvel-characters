// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    CharactersRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CharactersPage(),
      );
    },
    CharacterDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CharacterDetailsPage(
          key: args.key,
          character: args.character,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          CharactersRoute.name,
          path: '/',
        ),
        RouteConfig(
          CharacterDetailsRoute.name,
          path: '/character-details-page',
        ),
      ];
}

/// generated route for
/// [CharactersPage]
class CharactersRoute extends PageRouteInfo<void> {
  const CharactersRoute()
      : super(
          CharactersRoute.name,
          path: '/',
        );

  static const String name = 'CharactersRoute';
}

/// generated route for
/// [CharacterDetailsPage]
class CharacterDetailsRoute extends PageRouteInfo<CharacterDetailsRouteArgs> {
  CharacterDetailsRoute({
    Key? key,
    required Character character,
  }) : super(
          CharacterDetailsRoute.name,
          path: '/character-details-page',
          args: CharacterDetailsRouteArgs(
            key: key,
            character: character,
          ),
        );

  static const String name = 'CharacterDetailsRoute';
}

class CharacterDetailsRouteArgs {
  const CharacterDetailsRouteArgs({
    this.key,
    required this.character,
  });

  final Key? key;

  final Character character;

  @override
  String toString() {
    return 'CharacterDetailsRouteArgs{key: $key, character: $character}';
  }
}
