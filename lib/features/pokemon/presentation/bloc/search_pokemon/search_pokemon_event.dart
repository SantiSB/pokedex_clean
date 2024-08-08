part of 'search_pokemon_bloc.dart';

// Clase base para todos los eventos relacionados con la búsqueda de Pokémons.
// Esta clase está sellada, lo que significa que solo se puede extender dentro del mismo archivo, proporcionando una lista restringida de subtipos.
sealed class SearchPokemonEvent {}

// Evento que se dispara para buscar un Pokémon.
class OnSearchPokemon extends SearchPokemonEvent {}

// Evento que se dispara para capturar un Pokémon.
// [pokemon]: El Pokémon que se desea capturar.
class OnCapturePokemon extends SearchPokemonEvent {
  final Pokemon pokemon;

  // Constructor para inicializar el evento con un Pokémon específico.
  OnCapturePokemon({required this.pokemon});
}

// Evento que se dispara para obtener la lista de Pokémons capturados.
class OnGetCapturedPokemons extends SearchPokemonEvent {
  // Constructor sin parámetros para inicializar el evento.
  OnGetCapturedPokemons();
}

// Un Evento es una clase que representa una acción que se dispara en la aplicación.
// En este caso, los eventos representan las acciones de búsqueda, captura y obtención de Pokémons.