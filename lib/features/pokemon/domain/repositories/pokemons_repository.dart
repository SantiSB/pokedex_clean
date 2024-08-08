import 'package:dartz/dartz.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:pokedex_clean/features/pokemon/domain/entities/pokemon.dart';

// Repositorio de Pokémons (define los metodos que luego implementará la capa data).
// Define la interfaz para interactuar con los datos de los Pokémons.
abstract class PokemonsRepository {
  // El método recibe un [int] que representa el ID del Pokémon que se quiere obtener.
  Future<Either<Failure, Pokemon>> getPokemon(int id);

  // El método recibe un [Pokemon] que representa el Pokémon que se quiere capturar.
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon);

  // El método devuelve una lista de [Pokemon] que representa los Pokémons capturados.
  Future<Either<Failure, List>> getCapturedPokemon();
}

// Los repositorios de la capa domain son interfaces que definen los métodos que luego serán implementados por la capa de datos.