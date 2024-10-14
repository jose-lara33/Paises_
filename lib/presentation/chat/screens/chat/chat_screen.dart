import 'package:flutter/material.dart';
import 'package:paises_api/domain/entities/message.dart';
import 'package:paises_api/presentation/chat/providers/chat_provider.dart';
import 'package:paises_api/presentation/chat/widget/chat/her_message_bubble.dart.dart';
import 'package:paises_api/presentation/chat/widget/chat/my_message_bubble.dart';
import 'package:paises_api/presentation/chat/widget/chat/shared/message_field_box.dart';

import 'package:provider/provider.dart';



class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paises'),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://img2.rtve.es/i/?w=1600&i=01718703492072.jpg'),
          ),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        // 'Padding' debe empezar con mayúscula
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0), // Asegúrate de que los argumentos sean correctos
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final Message message = chatProvider.messageList[index];
                  return (message.fromwho == FromWho.her)
                       ? HermenssageDouble( message: message )
                       : MyMessageBubble( message: message );
                  //  final menssage = ChatProvider.menssageList[index];
                },
              ),
            ),
            const MessageFieldBox(),
            const SizedBox(height: 10),
            // const Text('esto es un chat'), // Añadí const para optimización
          ],
        ),
      ),
    );
  }
}
