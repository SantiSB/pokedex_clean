import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_clean/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:pokedex_clean/features/pokemon/presentation/widgets/pokemon_card.dart';

class CapturedPokemonsScreen extends StatelessWidget {
  const CapturedPokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Captured Pokemons'),
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Muestra una lista horizontal de tarjetas de Pokémons capturados
                  SizedBox(
                    height: 150,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: state.pokemons
                          .map((p) => PokemonCard(pokemon: p))
                          .toList(),
                    ),
                  ),
                ],
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
