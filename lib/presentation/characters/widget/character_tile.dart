import 'package:flutter/material.dart';
import 'package:marvel_characters/models/character.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    super.key,
    required this.character,
    required this.onPressed,
  });

  final Character character;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: ColoredBox(
        color: const Color(0xff151515),
        child: InkWell(
          onTap: onPressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _CharacterThumbailAvatar(avatarUrl: character.thumbnail.url),
              const SizedBox(width: 16),
              _CharacterTileTitle(text: character.name),
            ],
          ),
        ),
      ),
    );
  }
}

class _CharacterTileTitle extends StatelessWidget {
  const _CharacterTileTitle({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }
}

class _CharacterThumbailAvatar extends StatelessWidget {
  const _CharacterThumbailAvatar({
    required this.avatarUrl,
  });

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      avatarUrl,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}
