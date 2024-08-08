import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_clean/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:pokedex_clean/features/pokemon/presentation/widgets/pokemon_card.dart';

/// Pantalla principal que muestra los Pokémons.
/// Utiliza el patrón Bloc para manejar los estados y eventos relacionados con la búsqueda, captura y visualización de Pokémons.
// StatelessWidget: un widget que no mantiene estado.
class PokemonsScreen extends StatelessWidget {
  // Constructor de la clase PokemonsScreen.
  const PokemonsScreen({super.key});

  @override
  // Método build que construye la interfaz de usuario de la pantalla.
  Widget build(BuildContext context) {
    // Scaffold: un widget de Material que implementa la estructura visual básica de una pantalla.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          // Botón para ver los Pokémons capturados
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              BlocProvider.of<SearchPokemonBloc>(context)
                  .add(OnGetCapturedPokemons());
              // Navega a la pantalla de Pokémons capturados
              Navigator.pushNamed(context, '/captured');
            },
          ),
        ],
      ),
      // Barra superior de la pantalla.
      body: BlocBuilder<SearchPokemonBloc, SearchPokemonState>(
        // BlocBuilder: un widget que escucha los cambios en un Bloc y reconstruye el widget en función del nuevo estado.
        builder: (context, state) {
          // Manejo de diferentes estados del Bloc
          switch (state) {
            // Estado de carga: muestra un indicador de progreso
            case SearchPokemonLoading():
              return const Center(child: CircularProgressIndicator());

            // Estado inicial: muestra opciones para generar y ver Pokémons capturados
            case SearchPokemonInitial():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Botón para generar un Pokémon aleatorio
                    ElevatedButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnSearchPokemon()),
                        style: ElevatedButton.styleFrom(),
                        child: const Text('Generar pokemon aleatorio')),
                  ],
                ),
              );

            // Estado de éxito: muestra el Pokémon y los botones para capturar y generar otro Pokémon
            case SearchPokemonSuccess():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Pokémon card
                    PokemonCard(pokemon: state.pokemon),

                    const SizedBox(height: 20),

                    // Botón para capturar Pokémon
                    FilledButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnCapturePokemon(pokemon: state.pokemon)),
                        style: FilledButton.styleFrom(),
                        child: Text('Capturar a ${state.pokemon.name}')),

                    const SizedBox(height: 20),

                    // Botón para generar otro Pokémon
                    OutlinedButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnSearchPokemon()),
                        style: OutlinedButton.styleFrom(),
                        child: const Text('Generar otro Pokemon')),
                  ],
                ),
              );

            // Estado de fallo: muestra un mensaje de error y el boton para volver a generar un nuevo Pokémon
            case SearchPokemonFailure():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Ha ocurrido un error'),

                    const SizedBox(height: 20),

                    // Botón para volver a generar un nuevo Pokémon
                    ElevatedButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnSearchPokemon()),
                        style: ElevatedButton.styleFrom(),
                        child: const Text('Volver a generar pokemon'))
                  ],
                ),
              );

            // Estado default: muestra un mensaje de error
            default:
              return const Center(
                child: Text('Ha ocurrido un error inesperado'),
              );
          }
        },
      ),
    );
  }
}
