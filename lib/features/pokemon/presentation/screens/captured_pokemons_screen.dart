import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_clean/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:pokedex_clean/features/pokemon/presentation/widgets/pokemon_grid_card.dart';

class CapturedPokemonsScreen extends StatelessWidget {
  const CapturedPokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Captured Pokemons'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Cambia el estado a SearchPokemonInitial antes de regresar
            BlocProvider.of<SearchPokemonBloc>(context)
                .add(OnSearchPokemon());
            Navigator.of(context).pop(); // Navega hacia atrás
          },
        ),
      ),
      body: BlocBuilder<SearchPokemonBloc, SearchPokemonState>(
        builder: (context, state) {
          if (state is SearchPokemonList) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Número de columnas en el grid
                  childAspectRatio: 3 / 2, // Proporción ancho/alto de los ítems
                  crossAxisSpacing: 8, // Espacio horizontal entre ítems
                  mainAxisSpacing: 8, // Espacio vertical entre ítems
                ),
                itemCount: state.pokemons.length,
                itemBuilder: (context, index) {
                  return PokemonGridCard(pokemon: state.pokemons[index]);
                },
              ),
            );
          } else if (state is SearchPokemonLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
              child: Text('No captured pokemons yet'),
            );
          }
        },
      ),
    );
  }
}
