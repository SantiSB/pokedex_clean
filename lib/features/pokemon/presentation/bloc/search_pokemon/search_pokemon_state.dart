part of 'search_pokemon_bloc.dart';

// Clase base para todos los estados relacionados con la búsqueda de Pokémons.
// Esta clase está sellada, lo que significa que solo se puede extender dentro del mismo archivo, proporcionando una lista restringida de subtipos.
sealed class SearchPokemonState {}

// Estado inicial del Bloc.
// Indica que la búsqueda de Pokémon aún no ha comenzado.
final class SearchPokemonInitial extends SearchPokemonState {}

// Estado de carga del Bloc.
// Indica que una búsqueda de Pokémon está en progreso.
final class SearchPokemonLoading extends SearchPokemonState {}

// Estado de éxito de la búsqueda de Pokémon.
// Contiene el Pokémon encontrado.
final class SearchPokemonSuccess extends SearchPokemonState {
  final Pokemon pokemon;

  // Constructor para inicializar el estado con el Pokémon encontrado.
  SearchPokemonSuccess({required this.pokemon});
}

// Estado que contiene la lista de Pokémons capturados.
// Contiene una lista de Pokémons.
final class SearchPokemonList extends SearchPokemonState {
  final List<Pokemon> pokemons;

  // Constructor para inicializar el estado con la lista de Pokémons capturados.
  SearchPokemonList({required this.pokemons});
}

// Estado de fallo de la búsqueda de Pokémon.
// Contiene la información del fallo.
final class SearchPokemonFailure extends SearchPokemonState {
  final Failure failure;

  // Constructor para inicializar el estado con la información del fallo.
  SearchPokemonFailure({required this.failure});
}

// Un Estado es una clase que representa el estado de la aplicación en un momento dado.
// En este caso, los estados representan el estado de la búsqueda de Pokémons, que puede ser inicial, de carga, de éxito, de fallo o de lista de Pokémons capturados.