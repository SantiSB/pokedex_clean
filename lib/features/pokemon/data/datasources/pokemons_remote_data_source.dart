import 'package:pokedex_clean/features/pokemon/data/models/pokemon_model.dart';
import 'package:dio/dio.dart';

// Fuente de datos remota para obtener la información de los Pokémons.
abstract class PokemonsRemoteDataSource {
  // Método que obtiene la información de un Pokémon por su ID.
  // [id]: Identificador único del Pokémon.
  // Retorna un [Future] que contiene un [PokemonModel].
  Future<PokemonModel> getPokemon(int id);
}

// Implementación de la fuente de datos remota para obtener la información de los Pokémons.
class PokemonsRemoteDataSourcesImpl implements PokemonsRemoteDataSource {
  // Cliente HTTP para realizar peticiones a la API.
  final Dio dio = Dio();

  // Método que obtiene la información de un Pokémon por su ID.
  // Sobrescribe (override) el método [getPokemon] de la clase abstracta [PokemonsRemoteDataSources].
  // Realiza una petición GET a la API de Pokémons y retorna la información en formato JSON.
  @override
  Future<PokemonModel> getPokemon(int id) async {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon/$id');
    return PokemonModel.fromJson(response.data);
  }
}

// ¿Por qué la clase es abstracta?
// La clase abstracta define un contrato que debe ser implementado por las clases que la extienden.
// Si en el futuro se necesita obtener la información de otra API, solo es necesario crear una nueva clase que extienda de [PokemonsRemoteDataSources] y sobrescribir el método [getPokemon].
