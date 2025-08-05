import 'package:intl/intl.dart';

/// Una colección de formateadores de números comunes.
///
/// Utiliza el paquete `intl` para un formato localizado.
class NumberFormatters {
  /// Formatea un número a un formato de moneda.
  ///
  /// Ejemplo: `1234.56` -> `€1,234.56`
  /// [locale] se puede especificar para diferentes idiomas. Por defecto es 'es_ES'.
  /// [symbol] se puede personalizar. Por defecto es el símbolo de la moneda del locale.
  static String toCurrency(
    num number, {
    String locale = 'es_ES',
    String? symbol,
  }) {
    return NumberFormat.currency(locale: locale, symbol: symbol).format(number);
  }

  /// Formatea un número a un formato compacto.
  ///
  /// Ejemplo: `12345` -> `12 mil` en 'es'
  /// [locale] se puede especificar para diferentes idiomas. Por defecto es 'es_ES'.
  static String toCompact(num number, {String locale = 'es_ES'}) {
    return NumberFormat.compact(locale: locale).format(number);
  }

  /// Formatea un número a un formato de porcentaje.
  ///
  /// Ejemplo: `0.75` -> `75%`
  /// [locale] se puede especificar para diferentes idiomas. Por defecto es 'es_ES'.
  static String toPercent(num number, {String locale = 'es_ES'}) {
    return NumberFormat.percentPattern(locale).format(number);
  }
}
