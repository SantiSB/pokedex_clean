import 'package:get_it/get_it.dart';
import 'package:pokedex_clean/features/pokemon/data/datasources/pokemons_local_data_source.dart';
import 'package:pokedex_clean/features/pokemon/data/datasources/pokemons_remote_data_source.dart';
import 'package:pokedex_clean/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_clean/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:pokedex_clean/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:pokedex_clean/features/pokemon/domain/use_cases/get_captured_pokemons.dart';
import 'package:pokedex_clean/features/pokemon/domain/use_cases/search_pokemon.dart';
import 'package:pokedex_clean/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  // Bloc
  di.registerFactory(
    () => SearchPokemonBloc(
      di(),
      di(),
      di(),
    ),
  );

  // Use cases
  di.registerLazySingleton(() => CapturePokemonUseCase(di()));
  di.registerLazySingleton(() => GetCapturedPokemonsUseCase(di()));
  di.registerLazySingleton(() => SearchPokemonUseCase(di()));

  // Repositories
  di.registerLazySingleton<PokemonsRepository>(
    () => PokemonsRepositoryImpl(
      pokemonsLocalDataSource: di(),
      pokemonsRemoteDataSource: di(),
    ),
  );

  // Data sources
  di.registerLazySingleton<PokemonsLocalDataSource>(
    () => HivePokemonsLocalDataSourceImpl(),
  );

  di.registerLazySingleton<PokemonsRemoteDataSource>(
    
    () => PokemonsRemoteDataSourcesImpl(),
  );
}
