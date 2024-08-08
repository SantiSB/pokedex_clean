import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:pokedex_clean/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokedex_clean/features/pokemon/domain/entities/pokemon.dart';

// Fuente de datos local para capturar Pokémons.
abstract class PokemonsLocalDataSource {
  Future<bool> capturePokemon(Pokemon pokemon);
  Future<List<PokemonModel>> getCapturedPokemonsList();
}

// Implementación de la fuente de datos local para capturar Pokémons.
class HivePokemonsLocalDataSourceImpl implements PokemonsLocalDataSource {
  // Constructor de la clase
  HivePokemonsLocalDataSourceImpl() {
    // Inicializa Hive
    Hive.initFlutter();
  }

  // Método para capturar un Pokémon
  @override
  Future<bool> capturePokemon(Pokemon pokemon) async {
    try {
      // Abre la caja de datos 'pokemons' en Hive
      Box<dynamic> box = await Hive.openBox('pokemons');

      // Almacena el Pokémon capturado en la caja de datos
      box.put(pokemon.id, PokemonModel.fromEntity(pokemon).toJson());

      // Retorna verdadero si la captura fue exitosa
      return true;
    } catch (error) {
      // En caso de error, imprime el error y lanza una excepción LocalFailure
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }

  // Método para obtener la lista de Pokémons capturados
  @override
  Future<List<PokemonModel>> getCapturedPokemonsList() async {
    try {
      // Abre la caja de datos 'pokemons' en Hive
      Box<dynamic> box = await Hive.openBox('pokemons');
      
      // Retorna la lista de Pokémons capturados
      return box.values.map((p) => PokemonModel.fromJson(p)).toList();
    } catch (error) {
      // En caso de error, imprime el error y lanza una excepción LocalFailure
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }
}

// Hive es una base de datos NoSQL que permite almacenar datos de forma persistente en el dispositivo.

// ¿Por qué la clase es abstracta?
// La clase abstracta define un contrato que debe ser implementado por las clases que la extienden.
// Si en el futuro se necesita almacenar los datos en otro formato o en otro lugar, solo es necesario crear una nueva clase que extienda de [PokemonsLocalDataSource] e implementar los métodos [capturePokemon] y [getCapturedPokemonsList].