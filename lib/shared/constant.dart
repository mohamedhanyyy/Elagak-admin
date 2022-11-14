import 'package:flutter/material.dart';

Widget logo = Image.asset("assets/images/Login3/3elagk WORD.png");

Widget backgroundImage(width, height) => Container(
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/Login3/background.png"),
      fit: BoxFit.cover,
    ),
  ),
);

Widget appBarIconNotification =
const Icon(Icons.notifications, color: Colors.black);

Widget appBarIconCart = const Icon(Icons.shopping_cart, color: Colors.black);

Widget appBarLogOut = const Icon(Icons.exit_to_app_rounded, color: Colors.black);

Widget myImage(String imageSrc) => Image.asset(imageSrc);
