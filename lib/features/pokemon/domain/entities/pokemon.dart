// Clase que representa la entidad Pokemon
class Pokemon {
  // Atributos de la clase Pokemon
  final String name;
  final String image;
  final int id;

  // Constructor de la clase Pokemon
  Pokemon({required this.name, required this.image, required this.id});
}

// Las entidades son clases que representan los objetos de dominio de la aplicación.
// Los objetos del dominio de la aplicación son aquellos que encapsulan la lógica de negocio y son independientes de la capa de presentación y de la capa de datos.