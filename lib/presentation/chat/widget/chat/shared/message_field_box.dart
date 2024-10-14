import 'package:flutter/material.dart';
import 'package:paises_api/presentation/chat/providers/chat_provider.dart';
import 'package:provider/provider.dart';


class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final chatprovider = context.watch<ChatProvider>();
    final textController = TextEditingController();
    final focusNode = FocusNode(); // Cambiado a FocusNode() correcto
    final colors = Theme.of(context).colorScheme;

    return TextFormField(
      focusNode: focusNode, // focusNode corregido
      controller: textController, // controlador corregido
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.primary),
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.value.text;
            chatprovider.sendMessage(textValue);
            print('send message + $textValue'); // Corregida interpolación
            textController.clear();
          },
          icon: const Icon(Icons.send),
        ),
      ),
      onFieldSubmitted: (value) {
        final textValue = textController.value.text;
        chatprovider.sendMessage(textValue);
        print('submit + $value'); // Corregido onFieldSubmitted
        textController.clear();
        focusNode.requestFocus(); // Corregido el uso de requestFocus
      },
      onChanged: (value) => print('Changed + $value'), // Corregido onChanged
    );
  }
}