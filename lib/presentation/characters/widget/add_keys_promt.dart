import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/cubit/marvel_characters_cubit.dart';
import 'access_keys_input.dart';
import 'cta_button.dart';

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
      ],
    );
  }
}
