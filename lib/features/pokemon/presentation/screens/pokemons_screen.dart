import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_clean/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:pokedex_clean/features/pokemon/presentation/widgets/pokemon_card.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.catching_pokemon),
            onPressed: () {
              BlocProvider.of<SearchPokemonBloc>(context)
                  .add(OnGetCapturedPokemons());
              Navigator.pushNamed(context, '/captured');
            },
          ),
        ],
      ),
      body: BlocBuilder<SearchPokemonBloc, SearchPokemonState>(
        builder: (context, state) {
          if (state is SearchPokemonLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchPokemonInitial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () =>
                          BlocProvider.of<SearchPokemonBloc>(context)
                              .add(OnSearchPokemon()),
                      style: ElevatedButton.styleFrom(),
                      child: const Text('Generar pokemon aleatorio')),
                ],
              ),
            );
          } else if (state is SearchPokemonSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PokemonCard(pokemon: state.pokemon),
                  const SizedBox(height: 20),
                  FilledButton(
                      onPressed: () =>
                          BlocProvider.of<SearchPokemonBloc>(context)
                              .add(OnCapturePokemon(pokemon: state.pokemon)),
                      style: FilledButton.styleFrom(),
                      child: Text('Capturar a ${state.pokemon.name}')),
                  const SizedBox(height: 20),
                  OutlinedButton(
                      onPressed: () =>
                          BlocProvider.of<SearchPokemonBloc>(context)
                              .add(OnSearchPokemon()),
                      style: OutlinedButton.styleFrom(),
                      child: const Text('Generar otro Pokemon')),
                ],
              ),
            );
          } else if (state is SearchPokemonFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Ha ocurrido un error'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () =>
                          BlocProvider.of<SearchPokemonBloc>(context)
                              .add(OnSearchPokemon()),
                      style: ElevatedButton.styleFrom(),
                      child: const Text('Volver a generar pokemon'))
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Ha ocurrido un error inesperado'),
            );
          }
        },
      ),
    );
  }
}
