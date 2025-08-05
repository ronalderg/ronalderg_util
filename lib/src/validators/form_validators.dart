import 'package:flutter/widgets.dart';

/// Una colección de funciones de validación de campos de formulario comunes.
///
/// Se pueden usar directamente con `TextFormField.validator` o componerse
/// juntos usando el método `compose`.
class FormValidators {
  /// Devuelve un validador que comprueba si el campo no está vacío.
  ///
  /// [message] es el mensaje de error personalizado.
  static String? Function(String?) notEmpty({String? message}) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return message ?? 'Este campo no puede estar vacío.';
      }
      return null;
    };
  }

  /// Devuelve un validador que comprueba un formato de correo electrónico válido.
  /// No comprueba si está vacío. Combínalo con `notEmpty` para eso.
  ///
  /// [message] es el mensaje de error personalizado.
  static String? Function(String?) isEmail({String? message}) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return null; // Debería ser manejado por notEmpty
      }
      // Una expresión regular común para la validación de correos electrónicos
      final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      );
      if (!emailRegex.hasMatch(value)) {
        return message ??
            'Por favor, introduce una dirección de correo válida.';
      }
      return null;
    };
  }

  /// Devuelve un validador que comprueba una longitud mínima.
  ///
  /// [min] es la longitud mínima requerida.
  /// [message] es el mensaje de error personalizado.
  static String? Function(String?) minLength(int min, {String? message}) {
    return (String? value) {
      // Este validador no debe activarse si el valor está vacío,
      // debe componerse con notEmpty.
      if (value == null || value.isEmpty) {
        return null;
      }
      if (value.length < min) {
        return message ?? 'Debe tener al menos $min caracteres.';
      }
      return null;
    };
  }

  /// Devuelve un validador que comprueba una longitud máxima.
  ///
  /// [max] es la longitud máxima permitida.
  /// [message] es el mensaje de error personalizado.
  static String? Function(String?) maxLength(int max, {String? message}) {
    return (String? value) {
      if (value != null && value.length > max) {
        return message ?? 'No puede tener más de $max caracteres.';
      }
      return null;
    };
  }

  /// Compone múltiples validadores en una única función de validación.
  static String? Function(String?) compose(
    List<String? Function(String?)> validators,
  ) {
    return (String? value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) {
          return error;
        }
      }
      return null;
    };
  }

  /// Devuelve un validador que comprueba si el número ingresado está entre el
  /// valor mínimo y el máximo ingresados
  ///
  /// [min] es el valor mínimo permitido
  /// [max] es el valor máximo permitido
  /// [message] es el mensaje de error personalizado.
  static String? Function(String?) between({
    required int min,
    required int max,
    String? message,
  }) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return null;
      }
      final number = int.tryParse(value);
      if (number == null) {
        return 'Por favor, introduce un número válido.';
      }
      if (number < min || number > max) {
        return message ?? 'El número debe estar entre $min y $max.';
      }
      return null;
    };
  }

  /// Devuelve un validador que comprueba si el valor de este campo coincide
  /// con el valor de otro [TextEditingController].
  ///
  /// Ideal para campos de "confirmar contraseña".
  ///
  /// [controller] es el controlador del otro campo de texto a comparar.
  /// [message] es el mensaje de error personalizado.
  static String? Function(String?) match(
    TextEditingController controller, {
    String? message,
  }) {
    return (String? value) {
      if (value != controller.text) {
        return message ?? 'Los valores no coinciden.';
      }
      return null;
    };
  }
}
