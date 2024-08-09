part of 'search_pokemon_bloc.dart';

// Clase base para los estados relacionados con la búsqueda y captura de Pokémons
// sealed significa que no se pueden crear instancias de esta clase fuera de este archivo
sealed class SearchPokemonState {}

// Estado inicial del Bloc cuando no se ha realizado ninguna acción
final class SearchPokemonInitial extends SearchPokemonState {}

// Estado que indica que una búsqueda de Pokémon está en progreso
final class SearchPokemonLoading extends SearchPokemonState {}

// Estado de éxito de la búsqueda de Pokémon, contiene el Pokémon encontrado
final class SearchPokemonSuccess extends SearchPokemonState {
  final Pokemon pokemon;

  // Constructor para inicializar el estado con el Pokémon encontrado
  SearchPokemonSuccess({required this.pokemon});
}

// Estado que contiene la lista de Pokémons capturados
final class SearchPokemonList extends SearchPokemonState {
  final List<Pokemon> pokemons;

  // Constructor para inicializar el estado con la lista de Pokémons capturados
  SearchPokemonList({required this.pokemons});
}

// Estado que indica que hubo un fallo en la búsqueda o captura de Pokémon, contiene la información del fallo
final class SearchPokemonFailure extends SearchPokemonState {
  final Failure failure;

  // Constructor para inicializar el estado con la información del fallo
  SearchPokemonFailure({required this.failure});
}
