import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:comp3130/theme/theme_provider.dart';
import 'package:comp3130/theme/theme.dart';

void main() {
  test('Initial Theme Test', () {
    final themeProvider = ThemeProvider();

    // Initial theme should be light mode
    expect(themeProvider.themeData, lightMode);
    expect(themeProvider.isDarkMode, false);
  });

  test('Theme Toggling Test', () {
    final themeProvider = ThemeProvider();

    // Toggle to dark mode
    themeProvider.toggleTheme();

    // Theme should be dark mode now
    expect(themeProvider.themeData, darkMode);
    expect(themeProvider.isDarkMode, true);

    // Toggle back to light mode
    themeProvider.toggleTheme();

    // Theme should be light mode again
    expect(themeProvider.themeData, lightMode);
    expect(themeProvider.isDarkMode, false);
  });
}
