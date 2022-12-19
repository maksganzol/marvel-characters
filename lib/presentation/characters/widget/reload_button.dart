import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/cubit/marvel_characters_cubit.dart';
import 'cta_button.dart';

class ReloadButton extends StatelessWidget {
  const ReloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CtaButton(
      label: 'Reload',
      onPressed: () => context.read<MarvelCharactersCubit>().loadCharacters(),
    );
  }
}
