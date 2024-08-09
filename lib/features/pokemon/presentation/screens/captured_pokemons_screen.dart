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
        backgroundColor:
            Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
            // Cuando se presiona el botón de retroceso
          onPressed: () {
            // Envía el evento OnSearchPokemon para restablecer el estado inicial
            BlocProvider.of<SearchPokemonBloc>(context).add(OnSearchPokemon());
            // Navega hacia atrás
            Navigator.of(context).pop();
          },
        ),
      ),
      // Construcción de la UI basada en el estado del BLoC
      body: BlocBuilder<SearchPokemonBloc, SearchPokemonState>(
        builder: (context, state) {
          // Si el estado es SearchPokemonList, muestra la lista de Pokémons capturados
          if (state is SearchPokemonList) {
            return Padding(
              padding:
                  const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Número de columnas en la grilla
                  childAspectRatio: 3 / 2, // Proporción (ancho/alto) de los ítems
                  crossAxisSpacing: 8, // Espacio horizontal entre ítems
                  mainAxisSpacing: 8, // Espacio vertical entre ítems
                ),
                itemCount: state.pokemons.length, // Número de ítems en la lista
                itemBuilder: (context, index) {
                  // Card para cada Pokémon en la lista
                  return PokemonGridCard(pokemon: state.pokemons[index]);
                },
              ),
            );
          } else if (state is SearchPokemonLoading) {
            // Si el estado es de carga, muestra un indicador de progreso
            return const Center(child: CircularProgressIndicator());
          } else {
            // Si no hay Pokémons capturados o ocurre un error, muestra un mensaje
            return const Center(
              child: Text('No captured pokemons yet'),
            );
          }
        },
      ),
    );
  }
}
