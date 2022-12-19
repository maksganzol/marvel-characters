import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_characters/models/character.dart';
import 'package:marvel_characters/utils/iterable_join_with.dart';

import 'character_attribute_section.dart';

class CharacterDetailsContent extends StatelessWidget {
  const CharacterDetailsContent({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(height: 24),
          _ContentTitle(text: character.name),
          if (character.description.isNotEmpty)
            _ContentDescription(text: character.description),
          ..._buildSections(),
        ].joinWith(const SizedBox(height: 16)),
      ),
    );
  }

  List<Widget> _buildSections() => [
        if (character.comics.items.isNotEmpty)
          CharacterAttributeSection(
            title: 'Comics',
            attribute: character.comics,
          ),
        if (character.series.items.isNotEmpty)
          CharacterAttributeSection(
            title: 'Series',
            attribute: character.series,
          ),
        if (character.stories.items.isNotEmpty)
          CharacterAttributeSection(
            title: 'Stories',
            attribute: character.stories,
          ),
        if (character.events.items.isNotEmpty)
          CharacterAttributeSection(
            title: 'Events',
            attribute: character.events,
          ),
      ];
}

class _ContentTitle extends StatelessWidget {
  const _ContentTitle({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}

class _ContentDescription extends StatelessWidget {
  const _ContentDescription({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: CupertinoColors.systemGrey,
        fontSize: 18,
      ),
    );
  }
}
