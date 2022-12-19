import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/cubit/cubit.dart';
import 'package:marvel_characters/di/service_locator.dart';
import 'package:marvel_characters/models/character.dart';
import 'package:marvel_characters/presentation/characters/widget/add_keys_promt.dart';
import 'package:marvel_characters/presentation/characters/widget/characters_list.dart';
import 'package:marvel_characters/router/router.dart';
import 'package:marvel_characters/utils/iterable_join_with.dart';
import 'widget/character_tile.dart';
import 'widget/characters_app_bar.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MarvelCharactersCubit(
        marvelCharactersRepository: ServiceLocator.injector(),
      ),
      child: const _CharactersScreen(),
    );
  }
}

class _CharactersScreen extends StatefulWidget {
  const _CharactersScreen();

  @override
  State<_CharactersScreen> createState() => __CharactersScreenState();
}

class __CharactersScreenState extends State<_CharactersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MarvelCharactersCubit>().loadCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => const [CharactersAppBar()],
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<MarvelCharactersCubit, MarvelCharactersState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.failure != null) {
          return Center(child: Text(state.failure?.message ?? ''));
        }
        if (state.characters != null) {
          return CharactersList(characters: state.characters!);
        }
        if (state.accessKeys == null) {
          return AddKeysPromt();
        }
        return const Center(child: Text('Load data'));
      },
    );
  }
}
