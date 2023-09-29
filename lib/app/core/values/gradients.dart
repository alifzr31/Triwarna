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
      Color(0xFFAFB1AE),
      Color(0xFFD8D8D8),
      Color(0xFFADA9AD),
      Color(0xFFCCCCCC),
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
      Color(0xFF8E8D8D),
      Color(0xFFBEC0C2),
      Color(0xFFA1A2A3),
      Color(0xFFB3B6B5),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}
