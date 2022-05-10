import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/translation.dart';
import '../models/translations-list.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {

  Translation trans1 = Translation('English', 'German', 'dog', 'hund');
  Translation trans2 = Translation('English', 'German', 'owl', 'eile');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
              Card(
                child: ListTile(
                  title: Row(
                      children: [
                        Text("${trans1.output} |"),
                        Text(" ${trans1.lang2}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500]
                          )),
                      ]),
                  subtitle: Row(
                      children: [
                        Text("${trans1.input} |"),
                        Text(" ${trans1.lang1}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500]
                        ))
                      ]),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.star,
                        // color: _selectedIndex != null && _selectedIndex == position
                        //     ? Colors.redAccent
                        //     : Colors.grey,
                      ),
                      onPressed: (){}),
                ),
              ),
              Card(
                child: ListTile(
                  title: Row(
                      children: [
                        Text("${trans2.output} |"),
                        Text(" ${trans2.lang2}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500]
                          )),
                      ]),
                  subtitle: Row(
                      children: [
                        Text("${trans2.input} |"),
                        Text(" ${trans2.lang1}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500]
                          ))
                      ]),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.star,
                        // color: _selectedIndex != null && _selectedIndex == position
                        //     ? Colors.redAccent
                        //     : Colors.grey,
                      ),
                      onPressed: (){}),
                ),
              ),
        ],
      ),
    );
  }
}
