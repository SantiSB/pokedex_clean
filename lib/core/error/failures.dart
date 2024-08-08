// Clase abstracta porque podemos tener distintos tipos de Failure
abstract class Failure {}

// Clase que representa un fallo de servidor (extiende de la clase abstracta Failure)
class ServerFailure extends Failure {}

// Clase que representa un fallo de conexión (extiende de la clase abstracta Failure)
class LocalFailure extends Failure {}