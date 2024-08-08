import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:pokedex_clean/core/utils/utils.dart';
import 'package:pokedex_clean/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_clean/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:pokedex_clean/features/pokemon/domain/use_cases/get_captured_pokemons.dart';
import 'package:pokedex_clean/features/pokemon/domain/use_cases/search_pokemon.dart';

part 'search_pokemon_event.dart';
part 'search_pokemon_state.dart';

// BloC para la búsqueda de Pokémons.
// Gestiona los eventos relacionados con la búsqueda, captura y obtención de Pokémons capturados.
class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  // Caso de uso para capturar un Pokémon.
  final CapturePokemonUseCase _capturePokemonUseCase;

  // Caso de uso para obtener la lista de Pokémons capturados.
  final GetCapturedPokemonsUseCase _getCapturedPokemonsUseCase;

  // Caso de uso para buscar un Pokémon.
  final SearchPokemonUseCase _searchPokemonUseCase;

  // Constructor que inicializa los casos de uso y el estado inicial.
  SearchPokemonBloc(
    this._capturePokemonUseCase,
    this._getCapturedPokemonsUseCase,
    this._searchPokemonUseCase,
  ) : super(SearchPokemonInitial()) {
    // Maneja el evento de búsqueda de un Pokémon.
    on<OnSearchPokemon>((event, emit) async {
      emit(SearchPokemonLoading());

      final resp = await _searchPokemonUseCase(randomPokemonId);

      resp.fold(
        (f) => emit(SearchPokemonFailure(failure: f)),
        (p) => emit(SearchPokemonSuccess(pokemon: p)),
      );
    });

    // Maneja el evento de captura de un Pokémon.
    on<OnCapturePokemon>((event, emit) async {
      final resp = await _capturePokemonUseCase(event.pokemon);

      resp.fold(
        (f) => emit(SearchPokemonFailure(failure: f)),
        (p) {},
      );
    });

    // Maneja el evento de obtención de la lista de Pokémons capturados.
    on<OnGetCapturedPokemons>((event, emit) async {
      final resp = await _getCapturedPokemonsUseCase();

      resp.fold(
        (f) => emit(SearchPokemonFailure(failure: f)),
        (ps) => emit(SearchPokemonList(pokemons: ps.cast<Pokemon>())),
      );
    });
  }
}

// Un bloc es un componente de Flutter que se encarga de manejar la lógica de negocio de la aplicación.
// En este caso, el bloc SearchPokemonBloc se encarga de manejar la lógica de búsqueda, captura y obtención de Pokémons.
// Para ello, se apoya en los casos de uso CapturePokemonUseCase, GetCapturedPokemonsUseCase y SearchPokemonUseCase.
// El bloc SearchPokemonBloc se compone de eventos y estados, que se encargan de gestionar las acciones y el estado de la aplicación.