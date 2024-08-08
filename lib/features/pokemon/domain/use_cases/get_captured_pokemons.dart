import 'package:dartz/dartz.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:pokedex_clean/features/pokemon/domain/repositories/pokemons_repository.dart';

// Caso de uso para obtener los Pokémons capturados
// Este caso de uso encapsula la lógica para obtener los Pokémons capturados utilizando el repositorio [PokemonsRepository].
class GetCapturedPokemonsUseCase {
  // Repositorio de Pokémons
  // Se inyecta una instancia de [PokemonsRepository] para interactuar con la fuente de datos.
  final PokemonsRepository repository;

  // Constructor que inicializa el repositorio
  GetCapturedPokemonsUseCase(this.repository);

  // Método que obtiene los Pokémons capturados
  // Retorna un [Future] que contiene un [Either]:
  // - [Failure] en caso de error
  // - [List] en caso de éxito, donde `List` es la lista de Pokémons capturados.
  Future<Either<Failure, List>> call() {
    // Llama al método getCapturedPokemon del repositorio
    return repository.getCapturedPokemon();
  }
}

// Los casos de uso representan los métodos del repositorio y actúan como un puente entre el input del usuario y la lógica de negocio.
// call Permite invocar el caso de uso como una función regular capturePokemonUseCase(pokemon).
