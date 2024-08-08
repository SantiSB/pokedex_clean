import 'package:dartz/dartz.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:pokedex_clean/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_clean/features/pokemon/domain/repositories/pokemons_repository.dart';

// Caso de uso para buscar un Pokémon
// Este caso de uso encapsula la lógica para buscar un Pokémon utilizando el repositorio [PokemonsRepository].
class SearchPokemonUseCase {
  // Repositorio de Pokémons
  // Se inyecta una instancia de [PokemonsRepository] para interactuar con la fuente de datos.
  final PokemonsRepository repository;

  // Constructor que inicializa el repositorio
  SearchPokemonUseCase(this.repository);

  // Método que busca un Pokémon
  // [id] es el id Pokémon que se quiere buscar.
  // Retorna un [Future] que contiene un [Either]:
  // - [Failure] en caso de error
  // - [Pokemon] en caso de éxito, donde `Pokemon` es la entidad que representa al Pokémon.
  
  Future<Either<Failure, Pokemon>> call(int id) {
    // Llama al método getPokemon del repositorio con el id especificado
    return repository.getPokemon(id);
  }
}

// Los casos de uso representan los métodos del repositorio y actúan como un puente entre el input del usuario y la lógica de negocio.
// call Permite invocar el caso de uso como una función regular capturePokemonUseCase(pokemon).
