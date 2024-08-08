import 'package:flutter/material.dart';
import 'pokemon_theme_colors.dart';

final ThemeData pokemonTheme = ThemeData(
  colorScheme: ColorScheme(
    primary: PokemonThemeColors.pokemonRed,
    primaryContainer: PokemonThemeColors.pokemonRed.withOpacity(0.7),
    secondary: PokemonThemeColors.pokemonBlue,
    secondaryContainer: PokemonThemeColors.pokemonBlue.withOpacity(0.7),
    surface: PokemonThemeColors.pokemonWhite,
    error: Colors.red,
    onPrimary: PokemonThemeColors.pokemonWhite,
    onSecondary: PokemonThemeColors.pokemonBlack,
    onSurface: PokemonThemeColors.pokemonBlack,
    onError: PokemonThemeColors.pokemonWhite,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: PokemonThemeColors.pokemonWhite,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: PokemonThemeColors.pokemonBlack),
    bodyMedium: TextStyle(color: PokemonThemeColors.pokemonGray),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: PokemonThemeColors.pokemonBlue,
      foregroundColor: PokemonThemeColors.pokemonWhite,
      shadowColor: PokemonThemeColors.pokemonBlack,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: PokemonThemeColors.pokemonBlue,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      side: const BorderSide(
        color: PokemonThemeColors.pokemonBlue,
        width: 2,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: PokemonThemeColors.pokemonBlue,
      foregroundColor: PokemonThemeColors.pokemonWhite,
      shadowColor: PokemonThemeColors.pokemonBlack,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
);
