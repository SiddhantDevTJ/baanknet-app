import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF00579C); // Dark blue from header
  static const Color secondaryColor = Color(0xFFFF5E15); // Orange from buttons
  static const Color lightOrange = Color(0xFFFFF7F3); // Orange from buttons
  static const Color backgroundColor = Color(0xFFFEF7F4); // Light background
  static const Color cardColor = Colors.white;
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;
  static const Color blackColor = Colors.black;
  static const Color textDarkColor = Color(0xFF333333);
  static const Color textLightColor = Color(0xFF888888);
  static const Color dividerColor = Color(0xFFEEEEEE);
  static Color homeDividerColor = Colors.black12;

  // Typography
  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(fontSize: 32.0, fontWeight: FontWeight.bold, color: textDarkColor),
    displayMedium: GoogleFonts.poppins(fontSize: 28.0, fontWeight: FontWeight.bold, color: textDarkColor),
    displaySmall: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.bold, color: textDarkColor),
    headlineLarge: GoogleFonts.poppins(fontSize: 22.0, fontWeight: FontWeight.w600, color: textDarkColor),
    headlineMedium: GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.w600, color: textDarkColor),
    headlineSmall: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w600, color: textDarkColor),
    titleLarge: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600, color: textDarkColor),
    titleMedium: GoogleFonts.poppins(fontSize: 15.0, fontWeight: FontWeight.w500, color: textDarkColor),
    titleSmall: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w500, color: textDarkColor),
    bodyLarge: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.normal, color: textDarkColor),
    bodyMedium: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: textDarkColor),
    bodySmall: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.normal, color: textLightColor),
    labelLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
  );

  // Button Styles
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: secondaryColor,
    foregroundColor: Colors.white,
    textStyle: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w500),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  static ButtonStyle secondaryButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: secondaryColor,
    textStyle: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w500),
    side: const BorderSide(color: secondaryColor),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  static ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: secondaryColor,
    textStyle: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w500),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );

  // Input Decoration
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: secondaryColor, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
    ),
    hintStyle: GoogleFonts.poppins(fontSize: 14.0, color: textLightColor),
  );

  // Card Theme
  static CardTheme cardTheme = CardTheme(
    color: cardColor,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    clipBehavior: Clip.hardEdge,
  );

  // App Bar Theme
  static AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: primaryColor,
    elevation: 0,
    titleTextStyle: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
  );

  // Tab Bar Theme
  static TabBarTheme tabBarTheme = TabBarTheme(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white.withOpacity(0.7),
    indicatorSize: TabBarIndicatorSize.tab,
    labelStyle: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w500),
    unselectedLabelStyle: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w400),
    indicator: const BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.all(Radius.circular(20))),
  );

  // Bottom Navigation Bar Theme
  static BottomNavigationBarThemeData bottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: secondaryColor,
    unselectedItemColor: textLightColor,
    selectedLabelStyle: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w500),
    unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w400),
    elevation: 8,
    type: BottomNavigationBarType.fixed,
  );

  // Chip Theme
  static ChipThemeData chipTheme = ChipThemeData(
    backgroundColor: backgroundColor,
    disabledColor: dividerColor,
    selectedColor: primaryColor,
    secondarySelectedColor: secondaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    labelStyle: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w500, color: textDarkColor),
    secondaryLabelStyle: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.white),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );

  // Main Theme Data
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        background: backgroundColor,
        surface: cardColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onBackground: textDarkColor,
        onSurface: textDarkColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      textTheme: textTheme,
      appBarTheme: appBarTheme,
      cardTheme: cardTheme,
      buttonTheme: const ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),
      outlinedButtonTheme: OutlinedButtonThemeData(style: secondaryButtonStyle),
      textButtonTheme: TextButtonThemeData(style: textButtonStyle),
      inputDecorationTheme: inputDecorationTheme,
      tabBarTheme: tabBarTheme,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      chipTheme: chipTheme,
      dividerTheme: const DividerThemeData(color: dividerColor, thickness: 1, space: 1),
      iconTheme: const IconThemeData(color: textDarkColor, size: 24),
      primaryIconTheme: const IconThemeData(color: Colors.white, size: 24),
    );
  }
}
