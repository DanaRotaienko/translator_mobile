import 'package:flutter/material.dart';

import '../widgets/translations-list-widgets.dart';
import '../widgets/translator-widgets.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({Key? key}) : super(key: key);

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  int selectedPage = 0;

  final _pageOptions = [
    const TranslatorWidget(),
    const ListWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        title: const Opacity(
          opacity: 0.6,
          child: Text(
            'Tartu NLP Translator',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[800],
        unselectedItemColor: Colors.grey[600],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Saved',
          ),
        ],
        onTap: (index){
           setState(() {
            selectedPage = index;
           });
        },
        currentIndex: selectedPage,
        selectedItemColor: Colors.teal[300],
      ),
    );
  }
}