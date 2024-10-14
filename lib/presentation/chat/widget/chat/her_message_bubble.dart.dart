

import 'package:flutter/material.dart';
import 'package:paises_api/domain/entities/message.dart';


// Esta clase representa un widget que muestra un mensaje con una imagen (si aplica)
class HermenssageDouble extends StatelessWidget {
  // Constructor de la clase que recibe un mensaje como parámetro
  const HermenssageDouble({super.key, required this.message});
  
  // Se define una variable final de tipo Message que será usada para mostrar el contenido
  final Message message;

  // Método build que define cómo se construirá este widget en pantalla
  @override
  Widget build(BuildContext context) {
    // Se regresa una columna (Column) que organiza varios widgets en una lista vertical
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alinea los hijos al inicio (izquierda)
      children: [
        // Un contenedor (Container) para mostrar el mensaje en un fondo de color
        Container(
          decoration: BoxDecoration(
            color: Colors.black, // Establece el fondo negro del contenedor
            borderRadius: BorderRadius.circular(20), // Bordes redondeados de 20 píxeles
          ),
          // Añade un padding (relleno interno) al contenedor para darle espacio a su contenido
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10), // Define el relleno en los ejes horizontal y vertical
            // Texto que contiene el mensaje del objeto `Message`
            child: Text(
              message.text, // El texto del mensaje
              style: const TextStyle(
                color: Colors.white, // Estilo del texto: color blanco
              ),
            ),
          ),
        ),
        const SizedBox(height: 5), // Añade un espacio de 5 píxeles entre el mensaje y la imagen
        // Muestra la imagen asociada al mensaje usando el widget ImagenDouble
        ImagenDouble(imageUrl: message.imagUrl)
      ],
    );
  }
}

// Clase que representa un widget para mostrar una imagen desde una URL
class ImagenDouble extends StatelessWidget {
  // Constructor que recibe la URL de la imagen como parámetro
  const ImagenDouble({super.key, this.imageUrl});
  
  // Variable final que almacena la URL de la imagen (puede ser nula)
  final String? imageUrl;

  // Método build que construye el widget de imagen
  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla para ajustar las dimensiones de la imagen
    final size = MediaQuery.of(context).size;

    // Devuelve un widget que muestra la imagen recortada con bordes redondeados
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Bordes redondeados de la imagen
      child: Image.network(
        imageUrl!, // URL de la imagen cargada desde la red
        width: size.width * 0.3, // Ancho de la imagen: 30% del ancho de la pantalla
        height: size.height * 0.3, // Alto de la imagen: 30% del alto de la pantalla
        fit: BoxFit.fill, // Ajusta la imagen para llenar todo el contenedor
        // Este método se usa para mostrar un indicador de carga mientras la imagen se descarga
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child; // Si la imagen ya está cargada, la muestra
          // Si la imagen aún se está cargando, muestra un indicador de progreso
          return SizedBox(
            width: size.width * 0.3, // Ancho del indicador: 30% del ancho de la pantalla
            height: 150, // Altura fija del indicador de progreso
            child: const Center(
              child: CircularProgressIndicator(), // Muestra un indicador circular de carga
            ),
          );
        },
      ),
    );
  }
}
