Una colección de utilidades y validadores útiles para proyectos de Flutter.

## Features

Este paquete proporciona un conjunto de utilidades comunes para Flutter.

### Validadores de Formularios (`FormValidators`)

- **notEmpty**: Comprueba si un campo no está vacío.
- **isEmail**: Valida el formato del correo electrónico.
- **minLength**: Exige una longitud mínima de caracteres.
- **maxLength**: Exige una longitud máxima de caracteres.
- **compose**: Combina múltiples validadores.
- **between**: Comprueba si un número está dentro de un rango específico.
- **match**: Comprueba si el valor de un campo coincide con otro.

### Utilidades de String (extensiones en `String`)

- **capitalize()**: Pone en mayúscula el primer carácter de una cadena.
- **toTitleCase()**: Pone en mayúscula el primer carácter de cada palabra.
- **isNumeric()**: Comprueba si una cadena contiene solo números.
- **isAlphabetOnly()**: Comprueba si una cadena contiene solo letras.

### Formateadores de Fecha (`DateFormatters`)

- **toReadableDate()**: Convierte un `DateTime` a una fecha legible (ej: `15 de octubre de 2023`).
- **toReadableDateTime()**: Convierte un `DateTime` a fecha y hora legibles (ej: `15 de octubre de 2023, 14:30`).
- **toShortDate()**: Convierte un `DateTime` a formato `dd/MM/yyyy`.
- **toTime()**: Convierte un `DateTime` a formato de hora `HH:mm`.
- **toRelativeTime()**: Muestra el tiempo de forma relativa (ej: `hace 5 minutos`).

### Formateadores de Números (`NumberFormatters`)

- **toCurrency()**: Formatea un número como moneda (ej: `€1,234.56`).
- **toCompact()**: Formatea un número a un formato compacto (ej: `12 mil`).
- **toPercent()**: Formatea un número como porcentaje (ej: `75%`).

## Getting started

Añade el paquete a tu `pubspec.yaml`:

```yaml
dependencies:
  ronalderg_util: ^0.0.1
  intl: ^0.19.0 # Requerido para DateFormatters
```

## Usage

Importa el paquete para usar las extensiones y clases de utilidad.

### Ejemplo de validación de correo electrónico

```dart
import 'package:ronalderg_util/ronalderg_util.dart';

TextFormField(
  validator: FormValidators.compose([
    FormValidators.notEmpty(message: 'El correo no puede estar vacío'),
    FormValidators.isEmail(message: 'Introduce un correo válido'),
  ]),
)
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
