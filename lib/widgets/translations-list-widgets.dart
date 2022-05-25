import 'package:final_project/models/TranslationDTO.dart';
import 'package:flutter/material.dart';

import '../database/database.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TranslationDto>>(
        future: DatabaseHelper.instance.getTranslations(),
        builder: (BuildContext context,
            AsyncSnapshot<List<TranslationDto>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Loading...'));
          }
          return snapshot.data!.isEmpty
              ? const Center(child: Text('No Translations'))
              : ListView(
            children: snapshot.data!.map((translation) {
              return Card(
                child: ListTile(
                  title: Row(
                      children: [
                        Text("${translation.output} |"),
                        Text(" ${translation.target}",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500]
                            )),
                      ]),
                      subtitle: Row(
                          children: [
                            Text("${translation.input} |"),
                            Text(" ${translation.source}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[500]
                                ))
                          ]),
                      trailing: IconButton(
                          icon: const Icon(
                            Icons.star,
                            color: Colors.teal,
                          ),
                          onPressed: () {
                            setState(() {});
                            selectedId = translation.id;
                            DatabaseHelper.instance.remove(translation.id!);
                          }),
                ),
              );
            }).toList(),
          );
        });
  }
}
