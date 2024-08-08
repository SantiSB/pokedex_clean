import 'package:flutter/material.dart';
import 'package:pokedex_clean/features/pokemon/domain/entities/pokemon.dart';

// Este widget muestra la imagen y el nombre de un Pokémon en una tarjeta.
class PokemonCard extends StatelessWidget {
  // Constructor que inicializa el widget con un Pokémon específico.
  const PokemonCard({super.key, required this.pokemon});

  // El Pokémon que se mostrará en la tarjeta.
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Imagen del Pokémon.
          Image.network(pokemon.image),
          // Nombre del Pokémon.
          Text(pokemon.name),
        ],
      ),
    );
  }
}
