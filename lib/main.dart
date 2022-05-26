import 'package:final_project/screens/start-screen.dart';
import 'package:final_project/screens/translator-screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreen(),
        '/translator': (context) => const TranslatorScreen()
      },
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.teal,
      ),
    );
  }
}