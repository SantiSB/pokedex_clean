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
            // Cuando se presiona el botón de pokeball
            onPressed: () {
              // Envía el evento para obtener los Pokémons capturados
              BlocProvider.of<SearchPokemonBloc>(context)
                  .add(OnGetCapturedPokemons());
              // Navega a la pantalla de Pokémons capturados
              Navigator.pushNamed(context, '/captured');
            },
          ),
        ],
      ),
      // Construcción de la UI basada en el estado del BLoC
      body: BlocBuilder<SearchPokemonBloc, SearchPokemonState>(
        builder: (context, state) {
          if (state is SearchPokemonLoading) {
            // Si el estado es de carga, muestra un indicador de progreso
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchPokemonInitial) {
            // Si el estado es inicial, muestra un botón para generar un Pokémon aleatorio
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () =>
                          BlocProvider.of<SearchPokemonBloc>(context).add(
                              OnSearchPokemon()), // Evento para generar un Pokémon aleatorio
                      style: ElevatedButton.styleFrom(),
                      child: const Text('Generar pokemon aleatorio')),
                ],
              ),
            );
          } else if (state is SearchPokemonSuccess) {
            // Si el estado es de éxito, muestra la card del Pokémon generado y opciones para capturarlo o generar otro
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PokemonCard(
                      pokemon: state.pokemon), // Card del Pokémon
                  const SizedBox(height: 20),
                  FilledButton(
                      onPressed: () => BlocProvider.of<SearchPokemonBloc>(
                              context)
                          .add(OnCapturePokemon(
                              pokemon: state
                                  .pokemon)), // Evento para capturar el Pokémon
                      style: FilledButton.styleFrom(),
                      child: Text('Capturar a ${state.pokemon.name}')),
                  const SizedBox(height: 20),
                  OutlinedButton(
                      onPressed: () =>
                          BlocProvider.of<SearchPokemonBloc>(context).add(
                              OnSearchPokemon()), // Evento para generar otro Pokémon
                      style: OutlinedButton.styleFrom(),
                      child: const Text('Generar otro Pokemon')),
                ],
              ),
            );
          } else if (state is SearchPokemonFailure) {
            // Si el estado es de fallo, muestra un mensaje de error y un botón para intentar nuevamente
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Ha ocurrido un error'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () =>
                          BlocProvider.of<SearchPokemonBloc>(context).add(
                              OnSearchPokemon()), // Evento para intentar generar otro Pokémon
                      style: ElevatedButton.styleFrom(),
                      child: const Text('Volver a generar pokemon'))
                ],
              ),
            );
          } else {
            // Si ocurre un error inesperado, muestra un mensaje de error genérico
            return const Center(
              child: Text('Ha ocurrido un error inesperado'),
            );
          }
        },
      ),
    );
  }
}
