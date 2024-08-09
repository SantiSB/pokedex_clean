import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:pokedex_clean/core/utils/utils.dart';
import 'package:pokedex_clean/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_clean/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:pokedex_clean/features/pokemon/domain/use_cases/get_captured_pokemons.dart';
import 'package:pokedex_clean/features/pokemon/domain/use_cases/search_pokemon.dart';

part 'search_pokemon_event.dart';
part 'search_pokemon_state.dart';

// Bloc que manejará los eventos y estados para buscar y capturar de Pokémons.
class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  // Se inyectan los casos de uso
  final CapturePokemonUseCase _capturePokemonUseCase;
  final GetCapturedPokemonsUseCase _getCapturedPokemonsUseCase;
  final SearchPokemonUseCase _searchPokemonUseCase;

  // Constructor del Bloc donde se inicializan los casos de uso y el estado inicial
  SearchPokemonBloc(
    this._capturePokemonUseCase,
    this._getCapturedPokemonsUseCase,
    this._searchPokemonUseCase,
  ) : super(SearchPokemonInitial()) {
    // El estado inicial es SearchPokemonInitial

    // Escucha el evento OnSearchPokemon y ejecuta la búsqueda del Pokémon
    on<OnSearchPokemon>((event, emit) async {
      emit(
          SearchPokemonLoading()); // Se emite un estado de carga mientras buscamos

      final resp = await _searchPokemonUseCase(
          randomPokemonId); // Usamos el caso de uso para buscar un Pokémon

      // fold es un método de Either que permite manejar los dos casos posibles: éxito o fallo
      resp.fold(
        (f) => emit(SearchPokemonFailure(
            failure: f)), // Si falla, se emite un estado de error
        (p) => emit(SearchPokemonSuccess(
            pokemon:
                p)), // Si tiene éxito, se emite un estado de éxito con el Pokémon encontrado
      );
    });

    // Escucha el evento OnCapturePokemon y ejecuta la captura del Pokémon
    on<OnCapturePokemon>((event, emit) async {
      final resp = await _capturePokemonUseCase(
          event.pokemon); // Usamos el caso de uso para capturar el Pokémon

      resp.fold(
        (f) => emit(SearchPokemonFailure(
            failure: f)), // Si falla, se emite un estado de error
        (p) {}, // Si tiene éxito, no se emite ningún estado porque no es necesario
      );
    });

    // Escucha el evento OnGetCapturedPokemons y obtiene la lista de Pokémons capturados
    on<OnGetCapturedPokemons>((event, emit) async {
      emit(
          SearchPokemonLoading()); // Se emite un estado de carga mientras obtenemos los Pokémons

      final resp =
          await _getCapturedPokemonsUseCase(); // Usamos el caso de uso para obtener la lista de Pokémons capturados

      resp.fold(
        (f) => emit(SearchPokemonFailure(
            failure: f)), // Si falla, se emite un estado de error
        (ps) {
          if (ps.isEmpty) {
            emit(SearchPokemonList(
                pokemons: [])); // Si la lista está vacía, se emite un estado con una lista vacía
          } else {
            emit(SearchPokemonList(
                pokemons: ps.cast<
                    Pokemon>())); // Si tiene éxito, se emite un estado con la lista de Pokémons capturados
          }
        },
      );
    });
  }
}
