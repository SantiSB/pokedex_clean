import 'package:pokedex_clean/features/pokemon/domain/entities/pokemon.dart';

// Modelo de datos que representa un Pokémon.
// Extiende la entidad [Pokemon] y añade métodos para convertir entre JSON y el modelo de datos.
class PokemonModel extends Pokemon {
  // Constructor que inicializa el modelo de datos.
  PokemonModel({required super.id, required super.name, required super.image});

  // Método de fábrica que crea una instancia de [PokemonModel] a partir de un JSON.
  // [json]: Mapa que contiene los datos en formato JSON.
  // Retorna una instancia de [PokemonModel].
  factory PokemonModel.fromJson(json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      image: json['sprites']['front_default'],
    );
  }

  // Método que convierte el modelo de datos de un Pokémon a JSON.
  // Retorna un [Map<String, dynamic>] que representa el modelo en formato JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sprites': {'front_default': image},
    };
  }

  // Método de fábrica que crea una instancia de [PokemonModel] a partir de una entidad [Pokemon].
  factory PokemonModel.fromEntity(Pokemon pokemon) {
    return PokemonModel(
      id: pokemon.id,
      name: pokemon.name,
      image: pokemon.image,
    );
  }
}

// La información de los datos puede venir en distintos formatos (JSON, XML, etc.).
// A la entidad [Pokemon] no le interesa cómo se crea o de dónde viene la información.
// Solo necesita los datos necesarios para representar un Pokémon.

// En cambio, el modelo [PokemonModel] sí se encarga de estos detalles, extendiendo las funcionalidades de la entidad para incluir métodos de conversión y parseo de datos.

// Un modelo es una clase que extiende a la entidad
// El modelo se encarga de convertir la información que viene de la fuente de datos a la entidad.
