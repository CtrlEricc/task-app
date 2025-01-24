import 'package:flutter/material.dart';
import 'package:task_app/ui/core/themes/colors.dart';

final appTheme = ThemeData(
  fontFamily: 'Inter',
  scaffoldBackgroundColor: Color(0xFFF9F5F4),
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: colorACACAC),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.disabled) ? colorACACAC : color393433;
      }),
      foregroundColor: const WidgetStatePropertyAll(Colors.white),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
    ),
  ),
);
