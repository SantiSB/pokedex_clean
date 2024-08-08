import 'package:flutter/material.dart';
import 'package:pokedex_clean/features/pokemon/domain/entities/pokemon.dart';

// Este widget muestra la imagen y el nombre de un Pokémon en una tarjeta.
class PokemonGridCard extends StatelessWidget {
  // Constructor que inicializa el widget con un Pokémon específico.
  const PokemonGridCard({super.key, required this.pokemon});

  // El Pokémon que se mostrará en la tarjeta.
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.5),
      child: Container(
        width: 150, // Ajustar el ancho del card para que sea más pequeño
        decoration: BoxDecoration(
          border: Border.all(
              color: theme.colorScheme.primary,
              width: 2), // Usa el color secondary
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Contenedor para manejar el tamaño y ajuste de la imagen
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15.0),
              ),
              child: Container(
                height: 85, // Reducir aún más la altura de la imagen
                width: double.infinity, // Usar todo el ancho del card
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(pokemon.image),
                    fit: BoxFit
                        .contain, // Ajusta la imagen para que no se corte ni se pixele
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 2.0), // Reducir el padding
              child: Flexible(
                child: Text(
                  pokemon.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
