import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';

class ThemeChangeIconButton extends StatelessWidget {
  const ThemeChangeIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Theme.of(context).brightness == Brightness.dark
            ? Icons.light_mode
            : Icons.dark_mode,
      ),
      onPressed: () {
        themeNotifier.value = themeNotifier.value == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light;
      },
    );
  }
}
