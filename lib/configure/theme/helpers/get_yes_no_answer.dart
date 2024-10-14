import 'package:dio/dio.dart';
import 'package:paises_api/domain/entities/message.dart';
import 'package:paises_api/infraestructure/paises_models.dart';

class GetYesNoAnswer {
  final Dio _dio = Dio(); // Instancia de Dio para hacer peticiones HTTP

  // Método que recibe el nombre del país como parámetro
  Future<Message> getAnswer(String countryName) async {
    try {
      // Hacemos la petición dio a la API de Rest Countries usando el nombre del país para que nos muestre sus datos
      final response =
          await _dio.get('https://restcountries.com/v3.1/name/$countryName');

      if (response.statusCode == 200) {
        // Obtenemos el primer país de la respuesta (la API devuelve una lista)
        final countryData = response.data[0];

        // Usamos el modelo para procesar los datos del país y obtener la capital y bandera
        final yesNoModel = YesnoModel.fromJsonMap(countryData);

        // Devolvemos un objeto Message que contiene la capital como texto y la bandera como imagen
        return yesNoModel.toMessageEntity();
      } else {
        throw Exception('Error al obtener la información del país');
      }
    } catch (e) {
      // Manejo de errores si algo sale mal , esto lo utitlizo porque no sabia que algunos nombres tienen que estar en igles , si no peta
      throw Exception('No se pudo obtener la información del país: $e');
    }
  }
}
