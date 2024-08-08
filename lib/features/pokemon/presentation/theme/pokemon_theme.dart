import 'package:flutter/material.dart';
import 'pokemon_theme_colors.dart';

final ThemeData pokemonTheme = ThemeData(
  colorScheme: ColorScheme(
    primary: PokemonThemeColors.pokeballRed,
    primaryContainer: PokemonThemeColors.pokeballRed.withOpacity(0.7),
    secondary: PokemonThemeColors.pokemonYellow,
    secondaryContainer: PokemonThemeColors.pokemonYellow.withOpacity(0.7),
    surface: PokemonThemeColors.pokeballWhite,
    error: Colors.red,
    onPrimary: PokemonThemeColors.pokeballWhite,
    onSecondary: PokemonThemeColors.pokeballBlack,
    onSurface: PokemonThemeColors.pokeballBlack,
    onError: PokemonThemeColors.pokeballWhite,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: PokemonThemeColors.pokeballWhite,
  appBarTheme: const AppBarTheme(
    backgroundColor: PokemonThemeColors.pokeballRed,
    foregroundColor: PokemonThemeColors.pokeballWhite,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: PokemonThemeColors.pokeballBlack),
    bodyMedium: TextStyle(color: PokemonThemeColors.tvGray),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: PokemonThemeColors.tvBlue,
      foregroundColor: PokemonThemeColors.pokeballWhite,
      shadowColor: PokemonThemeColors.pokeballBlack,
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
      foregroundColor: PokemonThemeColors.tvBlue,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      side: const BorderSide(
        color: PokemonThemeColors.tvBlue,
        width: 2,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: PokemonThemeColors.tvBlue,
      foregroundColor: PokemonThemeColors.pokeballWhite,
      shadowColor: PokemonThemeColors.pokeballBlack,
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
