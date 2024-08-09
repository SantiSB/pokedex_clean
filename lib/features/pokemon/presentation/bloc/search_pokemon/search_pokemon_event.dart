part of 'search_pokemon_bloc.dart';

// Clase base para los eventos relacionados con la búsqueda y captura de Pokémons
// sealed significa que no se pueden crear instancias de esta clase fuera de este archivo
sealed class SearchPokemonEvent {}

// Evento que se dispara para buscar un Pokémon
class OnSearchPokemon extends SearchPokemonEvent {}

// Evento que se dispara para capturar un Pokémon (Recibe el pokémon a capturar)
class OnCapturePokemon extends SearchPokemonEvent {
  final Pokemon pokemon;

  // Constructor para inicializar el evento con un Pokémon específico
  OnCapturePokemon({required this.pokemon});
}

// Evento que se dispara para obtener la lista de Pokémons capturados
class OnGetCapturedPokemons extends SearchPokemonEvent {
  // Constructor sin parámetros para inicializar el evento
  OnGetCapturedPokemons();
}
