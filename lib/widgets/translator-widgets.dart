import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TranslatorWidget extends StatefulWidget {
  const TranslatorWidget({Key? key}) : super(key: key);

  @override
  State<TranslatorWidget> createState() => _TranslatorWidgetState();
}

class _TranslatorWidgetState extends State<TranslatorWidget> {


  @override
  Widget build(BuildContext context) {
    var dropdownValue1;
    String hint = '  Choose language';
    String input;
    String output;
    var dropdownValue2;
    final languages = ['English', 'Estonian', 'Finnish', 'German', 'Latvian',
                       'Lithuanian', 'Lithuanian', 'Northern Sami', 'Russian',
                       'Southern Sami', 'Võro'];

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
                child: DropdownButton(
                  underline: SizedBox(),
                  value: dropdownValue1,
                  hint: Text("${hint}"),
                  onChanged: (value) {
                    setState(() {
                      dropdownValue1 = value;
                      hint = '  ${value}';
                    });
                  },
                  items: languages
                      .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                      .toList(),
                ),
              ),
            ),
            Text(
              '|',
              style: TextStyle(
                fontSize: 50,
                color: Colors.teal[900]
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(23.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
                child: DropdownButton(
                  underline: SizedBox(),
                  value: dropdownValue2,
                  hint: Text('  Choose language'),
                  items: languages
                      .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      dropdownValue2 = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 200,
          width: 400,
          child: Card(
            color: Colors.grey[800],
            child: TextField(
                decoration: InputDecoration (
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: 'Text',
              ),
            ),
          ),
        ),
        Container(
          height: 200,
          width: 400,
          child: Card(
            child: ListTile(
              title: Text("Text", style: TextStyle(color: Colors.grey[400]),),
            ),
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
