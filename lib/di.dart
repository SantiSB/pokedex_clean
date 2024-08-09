import 'package:get_it/get_it.dart';
import 'package:pokedex_clean/features/pokemon/data/datasources/pokemons_local_data_source.dart';
import 'package:pokedex_clean/features/pokemon/data/datasources/pokemons_remote_data_source.dart';
import 'package:pokedex_clean/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_clean/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:pokedex_clean/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:pokedex_clean/features/pokemon/domain/use_cases/get_captured_pokemons.dart';
import 'package:pokedex_clean/features/pokemon/domain/use_cases/search_pokemon.dart';
import 'package:pokedex_clean/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';

// Instancia de GetIt que se utiliza para registrar y resolver dependencias
final di = GetIt.instance;

// Función para inicializar las dependencias
Future<void> init() async {
  // Registro del Bloc
  // Cada vez que se solicite un SearchPokemonBloc, se creará una nueva instancia
  di.registerFactory(
    () => SearchPokemonBloc(
      di(), // Resuelve la dependencia para CapturePokemonUseCase
      di(), // Resuelve la dependencia para GetCapturedPokemonsUseCase
      di(), // Resuelve la dependencia para SearchPokemonUseCase
    ),
  );

  // Registro de casos de uso
  // Cada caso de uso es un singleton que se crea solo una vez y se reutiliza
  di.registerLazySingleton(() => CapturePokemonUseCase(
      di())); // Resuelve la dependencia para el repositorio
  di.registerLazySingleton(() => GetCapturedPokemonsUseCase(
      di())); // Resuelve la dependencia para el repositorio
  di.registerLazySingleton(() => SearchPokemonUseCase(
      di())); // Resuelve la dependencia para el repositorio

  // Registro de repositorios
  // El repositorio implementa la interfaz PokemonsRepository
  di.registerLazySingleton<PokemonsRepository>(
    () => PokemonsRepositoryImpl(
      pokemonsLocalDataSource:
          di(), // Resuelve la dependencia para la fuente de datos local
      pokemonsRemoteDataSource:
          di(), // Resuelve la dependencia para la fuente de datos remota
    ),
  );

  // Registro de fuentes de datos (Data Sources)
  // Estas son las implementaciones que proporcionan acceso a los datos locales y remotos
  di.registerLazySingleton<PokemonsLocalDataSource>(
    () =>
        HivePokemonsLocalDataSourceImpl(), // Fuente de datos local usando Hive
  );

  di.registerLazySingleton<PokemonsRemoteDataSource>(
    () => PokemonsRemoteDataSourcesImpl(), // Fuente de datos remota
  );
}
