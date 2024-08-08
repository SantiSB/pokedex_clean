import 'package:dartz/dartz.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:pokedex_clean/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_clean/features/pokemon/domain/repositories/pokemons_repository.dart';

// Caso de uso para capturar un Pokémon
// Este caso de uso encapsula la lógica para capturar un Pokémon utilizando el repositorio [PokemonsRepository].
class CapturePokemonUseCase {
  // Repositorio de Pokémons
  // Se inyecta una instancia de [PokemonsRepository] para interactuar con la fuente de datos.
  final PokemonsRepository repository;

  // Constructor que inicializa el repositorio
  CapturePokemonUseCase(this.repository);

  // Método que captura un Pokémon
  // [pokemon] es el Pokémon que se quiere capturar.
  // Retorna un [Future] que contiene un [Either]:
  // - [Failure] en caso de error
  // - [bool] en caso de éxito, donde `true` indica que la captura fue exitosa.
  Future<Either<Failure, bool>> call(Pokemon pokemon) {
    // Llama al método capturePokemon del repositorio con el Pokémon especificado
    return repository.capturePokemon(pokemon);
  }
}

// Los casos de uso representan los métodos del repositorio y actúan como un puente entre el input del usuario y la lógica de negocio.
// call Permite invocar el caso de uso como una función regular capturePokemonUseCase(pokemon).
