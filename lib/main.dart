import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woof_project/screens/home_page.dart';

void main() {
  runApp(const WoofApp());
}

class WoofApp extends StatelessWidget {
  const WoofApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: "homepage",
      routes: {"homepage": (context) => HomePage()},
    );
  }
}
