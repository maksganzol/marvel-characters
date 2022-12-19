import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_characters/models/character_attribute.dart';

class CharacterAttributeSection extends StatelessWidget {
  const CharacterAttributeSection({
    super.key,
    required this.attribute,
    required this.title,
  });

  final CharacterAttribute attribute;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          attribute.items.map((item) => item.name).join(', '),
          style: const TextStyle(
            color: CupertinoColors.systemGrey,
          ),
        ),
      ],
    );
  }
}
