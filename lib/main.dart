import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_clean/di.dart';
import 'package:pokedex_clean/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:pokedex_clean/features/pokemon/presentation/screens/captured_pokemons_screen.dart';
import 'package:pokedex_clean/features/pokemon/presentation/screens/pokemons_screen.dart';
import 'package:pokedex_clean/features/pokemon/presentation/theme/pokemon_theme.dart';

void main() async {
  await init(); // Inicializa las dependencias antes de arrancar la app
  runApp(const MyApp()); // Arranca la app utilizando MyApp como widget raíz
}

// Widget principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Registra el Bloc que manejará la lógica de búsqueda de Pokémons
        BlocProvider(create: (_) => GetIt.instance.get<SearchPokemonBloc>())
      ],
      child: MaterialApp(
        title: 'Pokemon APP',
        theme: pokemonTheme,
        home: const PokemonsScreen(),
        routes: {
          '/captured': (context) =>
              const CapturedPokemonsScreen(),
        },
      ),
    );
  }
}
