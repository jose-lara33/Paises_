import 'package:flutter/material.dart';
import 'package:paises_api/configure/theme/helpers/app_theme.dart';
import 'package:paises_api/presentation/chat/providers/chat_provider.dart';
import 'package:paises_api/presentation/chat/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        theme: AppTheme(selctedcolor: 4).theme(),
        debugShowCheckedModeBanner: false,
        title: 'Paises',
        home: const ChatScreen(),
      ),
    );
  }
}