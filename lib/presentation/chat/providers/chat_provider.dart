

import 'package:flutter/material.dart';
import 'package:paises_api/configure/theme/helpers/get_yes_no_answer.dart';
import 'package:paises_api/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYsNo = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Vamos a descubrir paises!!! ', fromwho: FromWho.me),
    Message(text: 'Escribamos el pais para saber la capital ', fromwho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    messageList.add(Message(text: text, fromwho: FromWho.me));

    if (!text.endsWith('?')) {
      // Llamamos a herEsply pasando el texto como argumento
      await herEsply(text);
    }

    moveToBottom();
    notifyListeners();
  }

  Future<void> herEsply(String countryName) async {
    // Llamada a getAnswer con el nombre del país como parámetro
    final herMenssage = await getYsNo.getAnswer(countryName);

    if (herMenssage.text.isEmpty) return;
    messageList.add(herMenssage);
    moveToBottom();
    notifyListeners();
  }

  Future<void> moveToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}