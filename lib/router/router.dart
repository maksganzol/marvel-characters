import 'package:auto_route/auto_route.dart';
import 'package:marvel_characters/models/character.dart';
import 'package:marvel_characters/presentation/character_details/character_details_page.dart';
import 'package:marvel_characters/presentation/characters/characters_page.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      initial: true,
      page: CharactersPage,
    ),
    AutoRoute(
      page: CharacterDetailsPage,
    )
  ],
)
class AppRouter extends _$AppRouter {}
