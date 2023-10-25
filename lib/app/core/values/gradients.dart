import 'package:flutter/material.dart';

class GradientColor {
  static final nomember = LinearGradient(
    colors: [
      const Color(0xFFDAD5E1),
      const Color(0xFFDAD5E1).withOpacity(0.8),
      const Color(0xFFDAD5E1).withOpacity(0.1),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const silver = LinearGradient(
    colors: [
      Color(0xFFBEC0C2),
      Color(0xFFD9D9D9),
      Color.fromARGB(255, 195, 194, 194),
      Color(0xFFD9D9D9),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const gold = LinearGradient(
    colors: [
      Color(0xFFAE8625),
      Color(0xFFF7EF8A),
      Color(0xFFD2AC47),
      Color(0xFFEDC967),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const platinum = LinearGradient(
    colors: [
      Color(0xFFD9D9D9),
      Color(0xFFF6F6F6),
      Color(0xFFDADADA),
      Color(0xFFF6F6F6),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static final platinumLabel = LinearGradient(
    colors: [
      const Color(0xFFDDDDDD).withOpacity(0.7),
      const Color(0xFFC5C5C5).withOpacity(0.8),
      const Color(0xFFB7B7B7).withOpacity(0.89),
      const Color(0xFF111111).withOpacity(0.5),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
