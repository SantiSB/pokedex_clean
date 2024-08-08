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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.5),
      child: Column(
        children: [
          // Imagen del Pokémon.
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15.0),
            ),
            child: Image.network(
              pokemon.image,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(
              pokemon.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
