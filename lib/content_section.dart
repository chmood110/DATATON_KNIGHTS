import 'package:flutter/material.dart';
import 'card_item.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({super.key});

  final List<Map<String, dynamic>> cardData = const [
    {
      "imagePath": "assets/image2.jpg",
      "title": "Base de datos PDN_S2",
      "date": "Estado Baja California",
      "description": "En la siguiente sección se incluirán los resultados obtenidos a través de representaciones gráficas y tablas, con el propósito de presentar de manera clara y estructurada la información analizada. Estas herramientas facilitarán la interpretación de los datos y permitirán una comprensión integral de los hallazgos obtenidos.",
       "additionalContent": [
        {
          "imagePath": "assets/tabla2.jpeg",
          "description":
          "Tabla 1. Configuración del Modelo Contiene los parámetros clave del modelo.."
        },
          {
          "imagePath": "assets/image3.jpg",
          "description":
          "Figura 1. Distribución de Nombres de Puesto (Top 10)."
        },
          {
          "imagePath": "assets/image4.jpg",
          "description":
          "Figura 2. Distribución de Niveles de Puesto."
        },
      ],
    },
    {
      "imagePath": "assets/image2.jpg",
      "title": "Base de datos  PDN_S2",
      "date": "Estados Chihuahua.",
      "description":
          "En la siguiente sección se incluirán los resultados obtenidos a través de representaciones gráficas y tablas, con el propósito de presentar de manera clara y estructurada la información analizada. Estas herramientas facilitarán la interpretación de los datos y permitirán una comprensión integral de los hallazgos obtenidos.",
      "additionalContent": [
        {
          "imagePath": "assets/image5.jpg",
          "description":
          "Fugura 1. Visualización de Clusters usando Autoencoder y k-medias."
          
        },
        {
          "imagePath": "assets/image6.png",
          "description":
          "Fugura 2.Relación entre Niveles de Responsabilidad y Puestos."
          
        },
    
      ],
    },
    {
      "imagePath": "assets/image2.jpg",
      "title": "Base de datos PDN S2",
      "date": "Estado Jalisco",
      "description": "En la siguiente sección se incluirán los resultados obtenidos a través de representaciones gráficas y tablas, con el propósito de presentar de manera clara y estructurada la información analizada. Estas herramientas facilitarán la interpretación de los datos y permitirán una comprensión integral de los hallazgos obtenidos.",
       "additionalContent": [
        {
          "imagePath": "assets/image7.png",
          "description":
          "Figura 1. Visualización de Clusters usando Autoencoder y k-medias."
        },
          {
          "imagePath": "assets/image8.png",
          "description":
          "Figura 2. Mapa de Calor de la Matriz de Correlación."
        },
         
      ],
    },
    {
      "imagePath": "assets/image9.png",
      "title": "Base de datos PDN_S6",
      "date": "Diciembre 2024",
      "description": "La visualización muestra la agrupación de datos sobre contrataciones públicas, incluyendo características como empresas participantes, montos y giros empresariales.",
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 900, // Ancho máximo del contenedor
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Wrap(
          spacing: 16, // Espaciado horizontal entre tarjetas
          runSpacing: 16, // Espaciado vertical entre tarjetas
          alignment: WrapAlignment.start,
          children: List.generate(
            cardData.length,
            (index) {
              final card = cardData[index];

              // Validación de datos opcionales
              final String date = card['date']?.isNotEmpty ?? false
                  ? card['date']
                  : 'Sin fecha'; // Valor por defecto

              return SizedBox(
                width: 400, // Ancho fijo de cada tarjeta
                child: CardItem(
                  imagePath: card['imagePath']!,
                  title: card['title']!,
                  date: date,
                  description: card['description']!,
                  additionalImages: card['additionalContent'] != null
                      ? (card['additionalContent'] as List)
                          .map((e) => e['imagePath'] as String)
                          .join(',')
                      : '',
                  additionalDescriptions: card['additionalContent'] != null
                      ? (card['additionalContent'] as List)
                          .map((e) => e['description'] as String)
                          .join(',')
                      : '',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
