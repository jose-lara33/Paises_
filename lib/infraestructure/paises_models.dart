

import 'package:paises_api/domain/entities/message.dart';

class YesnoModel {
  final String capital; // Este será el nombre de la capital
  final String flagImageUrl; // Este será la URL de la imagen de la bandera

  YesnoModel({
    required this.capital,
    required this.flagImageUrl,
  });

  // Factory constructor que toma el JSON y crea una instancia de YesnoModel
  factory YesnoModel.fromJsonMap(Map<String, dynamic> json) {
    return YesnoModel(
      capital: json["capital"] != null && json["capital"].isNotEmpty
          ? json["capital"][0] // Si la lista de capitales no está vacía, tomamos el primer valor
          : 'Capital no disponible', // En caso de no haber capital, mostramos un mensaje adecuado
      flagImageUrl: json["flags"]["png"], // URL de la imagen de la bandera en formato PNG
    );
  }

  // Convierte el modelo en una entidad Message
  Message toMessageEntity() => Message(
      text: 'La capital es: $capital', // Enviamos la capital como texto
      fromwho: FromWho.her, // Indica de quién proviene el mensaje
      imagUrl: flagImageUrl); // Imagen de la bandera
}