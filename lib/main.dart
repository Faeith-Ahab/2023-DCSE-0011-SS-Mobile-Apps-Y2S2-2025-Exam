import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 

import 'package:app/screens/mockup_screen_one.dart';
// import 'package:app/screens/mockup_screen_two.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MockupScreenOne(),
      // home: const MockupScreenTwo(),
      theme: ThemeData(

        textTheme: GoogleFonts.jostTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}



