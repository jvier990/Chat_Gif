import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 181, 27, 22);
const List<Color> _colorThemes = [
  _customColor,
  Color.fromARGB(255, 47, 78, 122),
  Color.fromARGB(255, 28, 44, 22),
  Color.fromARGB(255, 236, 94, 89),
  Color.fromARGB(255, 205, 134, 64),
  Color.fromARGB(255, 242, 242, 242),
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Solo se encuentra los Colores en un rango de 0 a ${_colorThemes.length - 1}');
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      //brightness: Brightness.dark);// modo oscuro
    );
  }
}
