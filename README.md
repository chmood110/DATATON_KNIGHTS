# Dataton Proyecto:

## Problema a resolver mediante el Modelo de autoencoder con k medias:

Este proyecto tiene como objetivo realizar el análisis y agrupación de un conjunto de datos relacionado con ocupaciones laborales, utilizando técnicas de preprocesamiento, reducción de dimensionalidad y clustering.

## Descripción del Dataset

El dataset **`dataset_ocupaciones.csv`** contiene información relacionada con ocupaciones y cargos públicos/privados, incluyendo detalles como:

- **ID del registro**
- **Clave del nivel educativo**
- **Carrera o área de conocimiento**
- **Puesto o empleo**
- **Función principal**
- **Remuneración anual**, entre otros.

El dataset presenta algunos problemas comunes, como valores faltantes, datos duplicados y columnas irrelevantes, que se abordan durante la etapa de preprocesamiento.

---

## Etapa 1: Preprocesamiento

El script `preprocesamiento.ipynb` realiza las siguientes acciones:
1. **Selección de columnas relevantes**: Basado en correlaciones cruzadas para identificar características significativas.
2. **Manejo de valores faltantes**: Eliminación de registros con valores nulos.
3. **Normalización**: Uso de `MinMaxScaler` para escalar los datos entre 0 y 1.

**Nota:** Las rutas de entrada y salida deben ajustarse según el entorno de trabajo.

## Etapa 2: Clustering con Autoencoder y K-Means

En esta etapa, se utiliza un modelo autoencoder para realizar una reducción de dimensionalidad, capturando las características más relevantes de los datos normalizados. Posteriormente, estas representaciones codificadas son procesadas mediante el algoritmo K-Means para identificar patrones o agrupar los datos en diferentes clústeres.

El script `encoder_kmedias.ipynb` realiza las siguientes acciones:
1. **Carga de datos normalizados:** Se toman los datos preprocesados de la etapa anterior.
2. **Entrenamiento del autoencoder:** Este modelo reduce la dimensión de los datos mientras preserva la información esencial.
3. **Clustering con K-Means:** Usando las representaciones codificadas, se agrupan los datos en un número definido de clústeres.
4. **Visualización de clusters:** Se aplica PCA para reducir aún más la dimensionalidad a 2D y representar gráficamente los grupos encontrados.

El resultado se guarda en un archivo CSV con las etiquetas de los clústeres asignadas, y se genera una visualización que permite explorar las agrupaciones

# Proyecto de Predicción de Remuneraciones usando Árboles de Decisión:

Este proyecto utiliza un modelo basado en árboles de decisión para predecir las ganancias anuales de un cargo público. El modelo está integrado con técnicas avanzadas de embeddings semánticos y reducción de dimensionalidad para procesar los datos.

---

## Descripción General

### Objetivo:
Predecir la **remuneración anual** de un cargo público basado en características específicas como:
- Carrera
- Área de conocimiento
- Puesto o empleo
- Función principal
- Nivel educativo, entre otros.

El modelo combina técnicas de preprocesamiento con **Sentence Transformers** para obtener embeddings, y utiliza un modelo **DecisionTreeRegressor** para realizar las predicciones.

### Tecnologías Usadas:
- **Sentence Transformers**: Para obtener embeddings semánticos a partir de texto.
- **PCA (Análisis de Componentes Principales)**: Para reducir la dimensionalidad de los embeddings.
- **DecisionTreeRegressor (scikit-learn)**: Para realizar las predicciones.
- **Joblib y Pickle**: Para cargar modelos preentrenados y escalar predicciones.

---

## Estructura del Proyecto

1. **Preprocesamiento**:
   - Limpieza del texto: Eliminación de puntuación y conversión a minúsculas.
   - Generación de embeddings utilizando el modelo `sentence-transformers/LaBSE`.
   - Reducción de dimensionalidad con PCA preentrenado.

2. **Entrenamiento del Modelo**:
   - División del dataset en entrenamiento y prueba (80%-20%).
   - Entrenamiento de un modelo de regresión basado en árboles de decisión.

3. **Predicción**:
   - Generación de nuevos embeddings para datos de entrada.
   - Predicción de las ganancias anuales con el modelo entrenado.
   - Desescalado de la predicción para interpretarla en valores originales.

---

## Archivos Importantes

- **`dataset_numerico.csv`**: Contiene los datos numéricos del problema, sin incluir la columna de remuneración anual del cargo público.
- **`pca_areas_50.pkl`, `pca_carreras_50.pkl`, `pca_empleos_100.pkl`, `pca_puestos_100.pkl`, `pca_funciones_125.pkl`**: Modelos PCA preentrenados para reducción de dimensionalidad de embeddings.
- **`scaler_remuneracion.pkl`**: Modelo de escalado para desescalar las predicciones.
- **`crear_dataset_numerico.ipynb`**: Script que genera el dataset numérico a partir de las características procesadas.

---

## Instrucciones de Ejecución

### Requisitos:
- **Python 3.x**
- Bibliotecas necesarias:
  - `pandas`, `numpy`, `scikit-learn`, `sentence-transformers`, `joblib`

### Pasos:
1. **Montar el Google Drive**:
   Asegúrese de montar su Google Drive para acceder a los archivos necesarios:
   ```python
   from google.colab import drive
   drive.mount('/content/drive')

