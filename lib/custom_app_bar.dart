import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // Fondo blanco
      elevation: 0,
      leadingWidth: 100, // Espacio para el logo
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image.asset(
          'assets/logo_data.png', // Ruta del logo
          fit: BoxFit.contain,
        ),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFFF9AA2), // Rosa
              Color(0xFF87CEEB), // Azul
              Color(0xFF8A4D8C), // Morado
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'DATATÓN Anticorrupción 2024',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
      centerTitle: true,
      toolbarHeight: 80, // Altura fija de la barra
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80); // Altura de la AppBar
}
