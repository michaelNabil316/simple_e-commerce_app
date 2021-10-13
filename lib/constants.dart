import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const MaterialColor kPrimaryColor = MaterialColor(
  0xFF7AB4B6,
  const <int, Color>{
    50: const Color(0xFFC8EEFA),
    100: const Color(0xFF0E7AC7),
    200: const Color(0xFF0E7AC7),
    300: const Color(0xFF0E7AC7),
    400: const Color(0xFF0E7AC7),
    500: const Color(0xFF0E7AC7),
    600: const Color(0xFF0E7AC7),
    700: const Color(0xFF0E7AC7),
    800: const Color(0xFF0E7AC7),
    900: const Color(0xFF0E7AC7),
  },
);
const MaterialColor kSubColor = MaterialColor(
  0xFF7AB4B6,
  const <int, Color>{
    50: const Color(0xFFB3D9E5),
    100: const Color(0xFFB3D9E5),
    200: const Color(0xFFB3D9E5),
    300: const Color(0xFFB3D9E5),
    400: const Color(0xFFB3D9E5),
    500: const Color(0xFFB3D9E5),
    600: const Color(0xFFB3D9E5),
    700: const Color(0xFFB3D9E5),
    800: const Color(0xFFB3D9E5),
    900: const Color(0xFFB3D9E5),
  },
);

const subColor = Color.fromARGB(255, 122, 180, 182);
const shadoSubColor = Color.fromARGB(150, 122, 180, 182);
final mainCardsText =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600);
const url = 'https://fakestoreapi.com/products/category';
const addToBasket =
    TextStyle(fontSize: 25, color: Colors.amber, fontWeight: FontWeight.w700);
const detailsTitle =
    TextStyle(fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.w700);
const detailsDescription =
    TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w500);
const detailsPrice =
    TextStyle(fontSize: 27, color: Colors.black, fontWeight: FontWeight.w600);
final doorpatelBord = BoxDecoration(
  border: Border.all(color: Colors.amber.shade400, width: 0.5),
  borderRadius: BorderRadius.circular(20),
  color: Colors.amber,
);
const addStyle = TextStyle(fontSize: 18, color: Colors.white);
const doorpatelTxtStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.black),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: subColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
