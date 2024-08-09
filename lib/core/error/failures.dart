// Clase abstracta para representar un fallo genérico en la aplicación
abstract class Failure {}

// Clase que representa un fallo relacionado con el servidor
// Extiende de la clase Failure para especificar este tipo de error
class ServerFailure extends Failure {}

// Clase que representa un fallo relacionado con la conexión o almacenamiento local
// Extiende de la clase Failure para especificar este tipo de error
class LocalFailure extends Failure {}
