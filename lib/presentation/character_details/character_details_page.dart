import 'package:flutter/material.dart';
import 'package:marvel_characters/models/character.dart';
import 'widget/character_details_content.dart';
import 'widget/thubmbnail_app_bar.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThumbnailAppBar(
        context: context,
        thmbnailUrl: character.thumbnail.url,
      ),
      backgroundColor: const Color(0xff151515),
      body: CharacterDetailsContent(character: character),
    );
  }
}
