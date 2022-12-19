import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/cubit/cubit.dart';
import 'package:marvel_characters/presentation/characters/widget/access_keys_input.dart';
import 'package:marvel_characters/presentation/characters/widget/cta_button.dart';

class AddKeysPromt extends StatelessWidget {
  const AddKeysPromt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'You don\'t have API keys.',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        CtaButton(
          onPressed: () => AccessKeysInput.show(
            context,
            currentKeys: null,
            onKeysSet: (accesskeys) =>
                context.read<MarvelCharactersCubit>().setAccessKeys(accesskeys),
          ),
          label: 'Add keys',
        ),
        const SizedBox(height: 120),
      ],
    );
  }
}
