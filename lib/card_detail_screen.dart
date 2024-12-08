import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'footer_section.dart';

class CardDetailScreen extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final String imagePath;
  final String additionalImages; // Imágenes adicionales separadas por comas
  final String additionalDescriptions; // Descripciones adicionales separadas por comas

  const CardDetailScreen({
    super.key,
    required this.title,
    required this.date,
    required this.description,
    required this.imagePath,
    required this.additionalImages,
    required this.additionalDescriptions,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> images = additionalImages.split(',').where((e) => e.isNotEmpty).toList();
    final List<String> descriptions = additionalDescriptions.split(',').where((e) => e.isNotEmpty).toList();

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          // Fondo con degradado original
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF9AA2),
                  Color(0xFF87CEEB),
                  Color(0xFF8A4D8C),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Contenido principal
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Imagen principal
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      imagePath,
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.4,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Fecha
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Título
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 100,
                    height: 2,
                    color: Colors.white70,
                  ),
                  const SizedBox(height: 16),
                  // Descripción principal
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      height: 1.5,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),
                  // Imágenes y descripciones adicionales
                  if (images.isNotEmpty && descriptions.isNotEmpty) ...[
                    const Divider(color: Colors.white70, thickness: 1),
                    const Text(
                      "Imágenes y descripciones adicionales",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(images.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Mostrar imagen adicional
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  images[index],
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height: 200,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 200,
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: Icon(
                                          Icons.image_not_supported,
                                          size: 50,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Mostrar descripción adicional
                              Text(
                                descriptions[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const FooterSection(),
    );
  }
}
