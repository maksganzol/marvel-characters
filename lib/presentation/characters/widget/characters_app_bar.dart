import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/cubit/cubit.dart';
import 'package:marvel_characters/presentation/characters/widget/access_keys_input.dart';

class CharactersAppBar extends StatelessWidget {
  const CharactersAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      largeTitle: const Text('Marvel characters'),
      trailing: _buildTrailing(),
    );
  }

  Widget _buildTrailing() {
    return BlocBuilder<MarvelCharactersCubit, MarvelCharactersState>(
      builder: (context, state) {
        if (state.accessKeys == null) return const SizedBox();
        return IconButton(
          onPressed: () => AccessKeysInput.show(
            context,
            currentKeys: state.accessKeys,
            onKeysSet: (accesskeys) =>
                context.read<MarvelCharactersCubit>().setAccessKeys(accesskeys),
          ),
          icon: const Icon(Icons.key),
        );
      },
    );
  }
}
