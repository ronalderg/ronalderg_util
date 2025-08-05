import 'package:intl/intl.dart';

/// Una colección de formateadores de fecha comunes para objetos [DateTime].
///
/// Utiliza el paquete `intl` para un formato localizado. Asegúrate de
/// añadir `intl` a tus dependencias en `pubspec.yaml`.
class DateFormatters {
  /// Formatea un [DateTime] a un formato de fecha legible por humanos.
  ///
  /// Ejemplo: `15 de octubre de 2023`
  /// [locale] se puede especificar para diferentes idiomas. Por defecto es 'es_ES'.
  static String toReadableDate(DateTime date, {String locale = 'es_ES'}) {
    return DateFormat.yMMMMd(locale).format(date);
  }

  /// Formatea un [DateTime] a un formato de fecha y hora legible por humanos.
  ///
  /// Ejemplo: `15 de octubre de 2023, 14:30`
  /// [locale] se puede especificar para diferentes idiomas. Por defecto es 'es_ES'.
  static String toReadableDateTime(DateTime date, {String locale = 'es_ES'}) {
    return DateFormat.yMMMMd(locale).add_jm().format(date);
  }

  /// Formatea un [DateTime] a un formato de fecha corta (dd/MM/yyyy).
  ///
  /// Ejemplo: `15/10/2023`
  static String toShortDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// Formatea un [DateTime] a un formato de hora (HH:mm).
  ///
  /// Ejemplo: `14:30`
  static String toTime(DateTime date) {
    return DateFormat.Hm().format(date);
  }

  /// Devuelve una representación relativa del tiempo de forma simplificada.
  ///
  /// Ejemplo: `hace 5 minutos`, `ayer`.
  /// Para una localización y complejidad mayores, considera usar un paquete
  /// dedicado como `timeago`.
  static String toRelativeTime(DateTime date) {
    final difference = DateTime.now().difference(date);

    if (difference.inSeconds < 60) return 'hace un momento';
    if (difference.inMinutes < 60)
      return 'hace ${difference.inMinutes} minuto${difference.inMinutes == 1 ? '' : 's'}';
    if (difference.inHours < 24)
      return 'hace ${difference.inHours} hora${difference.inHours == 1 ? '' : 's'}';
    if (difference.inDays == 1) return 'ayer';
    return 'hace ${difference.inDays} días';
  }
}
