import 'package:flutter/material.dart';
import 'content_section.dart';
import 'footer_section.dart';
import 'custom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF9AA2), // Rosa degradado inicial
                Color(0xFF87CEEB), // Azul degradado intermedio
                Color(0xFF8A4D8C), // Morado degradado final
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const SingleChildScrollView(
            child: Column(
              children: [
                ContentSection(), // Sección de contenido principal
                FooterSection(), // Pie de página
              ],
            ),
          ),
        ),
      ),
    );
  }
}
