import 'package:flutter/material.dart';

var primarColorCode = Colors.blue.value;

MaterialColor primaryColor = MaterialColor(
  primarColorCode, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: Color(primarColorCode), //10%
    100: Color(primarColorCode), //20%
    200: Color(primarColorCode), //30%
    300: Color(primarColorCode), //40%
    400: Color(primarColorCode), //50%
    500: Color(primarColorCode), //60%
    600: Color(primarColorCode), //70%
    700: Color(primarColorCode), //80%
    800: Color(primarColorCode), //90%
    900: Color(primarColorCode), //100%
  },
);

const Color darkGreen = Color(0xFFCCD5AE);
const Color lightGreen = Color(0xFFE9EDC9);
const Color regular = Color(0xFFFEFAE0);
const Color lightBrown = Color(0xFFFAEDCD);
const Color darkBrown = Color(0xFFD4A373);

const Color shadowColor = Color(0xFF000000);
const Color backgroundColor = Color(0xFFFFFFFF);

const Color secondaryColor = Color(0xFF2E3B62);

const Color textFieldBackground = Color(0xFFEBE9E9);
const Color textFieldHintColor = Color(0xFF766E6E);
