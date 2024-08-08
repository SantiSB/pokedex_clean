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
    final theme = Theme.of(context);

    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: theme.colorScheme.secondary,
                width: 2), // Usa el color secondary
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contenedor para manejar el tamaño y ajuste de la imagen
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15.0),
                ),
                child: Container(
                  height: 200,
                  width: 300, // Ajustar el ancho del card
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
                padding: const EdgeInsets.fromLTRB(
                    16.0, 8.0, 16.0, 16.0), // Reduce el padding superior
                child: Text(
                  pokemon.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
