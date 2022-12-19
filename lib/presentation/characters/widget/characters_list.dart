import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marvel_characters/models/character.dart';
import 'package:marvel_characters/router/router.dart';
import 'package:marvel_characters/utils/iterable_join_with.dart';

import 'character_tile.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({
    super.key,
    required this.characters,
  });

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: characters
            .map(
              (character) => CharacterTile(
                character: character,
                onPressed: () => context.router.push(
                  CharacterDetailsRoute(character: character),
                ),
              ),
            )
            .joinWith(const SizedBox(height: 24)),
      ),
    );
  }
}
