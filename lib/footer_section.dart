import 'package:dataton_project/custom_app_bar.dart';
import 'package:flutter/material.dart';


class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Asegura que ocupe todo el ancho
      color: Colors.white, // Fondo blanco
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Equipo Knigths',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Texto en negro
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Uriel, Marco, Oscar Henry y Ariadna.',
            style: TextStyle(fontSize: 12, color: Colors.black54), // Texto más claro
          ),
        ],
      ),
    );
  }
}

class CardDetailScreen extends StatelessWidget {
  final String title;
  final String date;
  final String description;

  const CardDetailScreen({
    super.key,
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(), // Barra superior reutilizada
      body: Container(
        width: double.infinity, // Asegura que el contenedor ocupe todo el ancho
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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0), // Ajusta el padding lateral
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Imagen destacada
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/image1.jpg', // Ruta a la imagen
                            width: MediaQuery.of(context).size.width * 0.8, // Responsivo
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Fecha
                      Center(
                        child: Text(
                          date,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Título
                      Center(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Línea decorativa
                      Center(
                        child: Container(
                          width: 100,
                          height: 2,
                          color: Colors.white54,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Descripción principal
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Descripción adicional
                      const Text(
                        "En este artículo exploramos cómo los datos abiertos pueden transformar la manera en que las instituciones públicas operan, fomentando la transparencia y la confianza ciudadana. Además, discutiremos ejemplos prácticos de implementación de tecnologías éticas en el ámbito de la IA.",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Footer que ocupa todo el ancho
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
