import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:pokedex_clean/features/pokemon/data/datasources/pokemons_local_data_source.dart';
import 'package:pokedex_clean/features/pokemon/data/datasources/pokemons_remote_data_source.dart';
import 'package:pokedex_clean/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_clean/features/pokemon/domain/repositories/pokemons_repository.dart';

// Implementación del repositorio de Pokémons
// Esta clase se encarga de la obtención y manipulación de datos de Pokémons, tanto de fuentes locales como remotas.
class PokemonsRepositoryImpl implements PokemonsRepository {
  // Fuente de datos local para los Pokémons
  final PokemonsLocalDataSource pokemonsLocalDataSource;

  // Fuente de datos remota para los Pokémons
  final PokemonsRemoteDataSource pokemonsRemoteDataSource;

  // Inyecta las fuentes de datos local y remota
  PokemonsRepositoryImpl({
    required this.pokemonsLocalDataSource,
    required this.pokemonsRemoteDataSource,
  });

  // Captura un Pokémon y lo guarda en la fuente de datos local
  // [pokemon]: El Pokémon que se quiere capturar.
  // Retorna un [Future] que contiene un [Either]:
  // - [Failure] en caso de error
  // - [bool] en caso de éxito, indicando si la captura fue exitosa.
  @override
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon) async {
    try {
      final bool resp = await pokemonsLocalDataSource.capturePokemon(pokemon);
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  // Obtiene la lista de Pokémons capturados de la fuente de datos local
  // Retorna un [Future] que contiene un [Either]:
  // - [Failure] en caso de error
  // - [List<Pokemon>] en caso de éxito, con la lista de Pokémons capturados.
  @override
  Future<Either<Failure, List<Pokemon>>> getCapturedPokemon() async {
    try {
      final List<Pokemon> resp = await pokemonsLocalDataSource.getCapturedPokemonsList();
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  // Obtiene la información de un Pokémon por su ID de la fuente de datos remota
  // [id]: El identificador único del Pokémon.
  // Retorna un [Future] que contiene un [Either]:
  // - [Failure] en caso de error
  // - [Pokemon] en caso de éxito, con la información del Pokémon.
  @override
  Future<Either<Failure, Pokemon>> getPokemon(int id) async {
    try {
      final Pokemon resp = await pokemonsRemoteDataSource.getPokemon(id);
      return Right(resp);
    } on DioException {
      return Left(ServerFailure());
    }
  }
}

// Un repositorio en la capa de datos es responsable de decidir de dónde obtener los datos y cómo devolverlos
// En este caso, el repositorio decide si obtener los datos de la fuente de datos local o remota