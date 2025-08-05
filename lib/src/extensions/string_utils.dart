/// Extension methods para la clase [String].
extension StringUtils on String {
  /// Convierte el primer carácter de la cadena a mayúsculas.
  ///
  /// Ejemplo:
  /// ```dart
  /// 'hello world'.capitalize(); // 'Hello world'
  /// ```
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Convierte el primer carácter de cada palabra en la cadena a mayúsculas.
  ///
  /// Ejemplo:
  /// ```dart
  /// 'hello world'.toTitleCase(); // 'Hello World'
  /// ```
  String toTitleCase() {
    if (isEmpty) {
      return this;
    }
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  /// Comprueba si la cadena contiene solo caracteres numéricos.
  ///
  /// Ejemplo:
  /// ```dart
  /// '123'.isNumeric(); // true
  /// '123a'.isNumeric(); // false
  /// ```
  bool isNumeric() {
    if (isEmpty) return false;
    return double.tryParse(this) != null;
  }

  /// Comprueba si la cadena contiene solo caracteres alfabéticos.
  bool isAlphabetOnly() {
    if (isEmpty) return false;
    final alphaRegex = RegExp(r'^[a-zA-Z]+$');
    return alphaRegex.hasMatch(this);
  }
}
