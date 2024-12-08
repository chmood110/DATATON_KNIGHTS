import 'package:flutter/material.dart';
import 'card_detail_screen.dart';

class CardItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String description;
  final String additionalImages; // Imágenes adicionales separadas por comas
  final String additionalDescriptions; // Descripciones adicionales separadas por comas

  const CardItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.description,
    required this.additionalImages,
    required this.additionalDescriptions, List? additionalContent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 120, // Altura fija de la imagen
              width: double.infinity,
              fit: BoxFit.cover, // Mostrar la imagen completa
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (date.isNotEmpty)
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    // Navegación a la pantalla de detalles
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardDetailScreen(
                          imagePath: imagePath,
                          title: title,
                          date: date,
                          description: description,
                          additionalImages: additionalImages, // Pasar imágenes adicionales
                          additionalDescriptions: additionalDescriptions, // Pasar descripciones adicionales
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Leer más",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
