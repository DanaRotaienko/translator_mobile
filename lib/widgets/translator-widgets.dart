import 'package:final_project/api/translator-api.dart';
import 'package:final_project/constants/languages.dart';
import 'package:final_project/models/TranslationDTO.dart';
import 'package:final_project/models/translation.dart';
import 'package:flutter/material.dart';

import '../database/database.dart';

class TranslatorWidget extends StatefulWidget {
  const TranslatorWidget({Key? key}) : super(key: key);

  @override
  State<TranslatorWidget> createState() => _TranslatorWidgetState();
}

class _TranslatorWidgetState extends State<TranslatorWidget> {

  static TextEditingController inputController = TextEditingController();
  String hint1 = '  Choose language';
  String hint2 = '  Choose language';
  var languages2 = Languages.languages;
  String lang1 = 'eng';
  String lang2 = 'eng';
  String inputTr = '';
  String output = 'Text';

  bool isFavorite = false;

  Future<String>? getTranslation() {
    Translation translation =
    Translation(lang1, lang2, inputTr);
    return TranslatorApi.fetchTranslation(translation);
  }


  @override
  void initState() {
    inputController.text = inputTr;

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    Object? dropdownValue1;
    Object? dropdownValue2;

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
                  underline: const SizedBox(),
                  value: dropdownValue1,
                  hint: Text(hint1),
                  onChanged: (value) {
                    setState(() {
                      dropdownValue1 = value;
                      lang1 = Languages.langCodes[Languages.languages.indexOf(value.toString())];
                      hint1 = '  $value';
                      languages2 = Languages.formatedLanguages(value.toString());
                    });
                  },
                  items: Languages.languages
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
                  underline: const SizedBox(),
                  value: dropdownValue2,
                  hint: Text(hint2),
                  items: languages2
                      .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      dropdownValue2 = value;
                      hint2 = '  $value';
                      lang2 = Languages.langCodes[Languages.languages.indexOf(value.toString())];
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          width: 400,
          child: Card(
            color: Colors.grey[800],
            child: TextField(
              controller: inputController,
              decoration: const InputDecoration (
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: 'Text',
              ),
              onChanged: (input) {
                  setState(() {
                    if (inputController.text != '') {
                      inputTr = inputController.text;
                      isFavorite = false;
                    }
                  });
              },
            ),
          ),
        ),
        SizedBox(
          height: 200,
          width: 400,
          child: FutureBuilder<String>(
            future: getTranslation(),
            builder:
                (BuildContext context, AsyncSnapshot<String> snapshot) {
              String response = "";
              if (lang1.isNotEmpty && lang2.isNotEmpty && inputTr.isNotEmpty) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  response = "Translating...";
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  response = snapshot.data ?? "Text";
                  output = response;
                }
              } else {
                response = 'Text';
              }
              return Card(
                   child: ListTile(
                     title: Text(response, style: TextStyle(color: Colors.grey[400])),
                   ),
                   color: Colors.grey[800],
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () async {
                isFavorite = isFavorite? false : true;
                setState(() {});
                await DatabaseHelper.instance.add(
                  TranslationDto(source: lang1, target: lang2, input: inputTr, output: output)
                );
              },
              child: Row(
                children: [
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Icon(
                          isFavorite? Icons.star : Icons.star_border,
                          color: isFavorite? Colors.teal : Colors.grey,
                      ),
                    ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
