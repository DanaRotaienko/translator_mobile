import 'dart:convert';

import 'package:http/http.dart' as http;
class Translation {
  String lang1;
  String lang2;
  String input;
  String output;

  Translation([this.lang1 = '', this.lang2 = '', this.input = '', this.output = '']);

  @override
  String toString() {
    return 'Translation{lang1: $lang1, lang2: $lang2, input: $input, output: $output}';
  }

  void setLang1(String newLang) {
    lang1 = newLang;
  }

  void setLang2(String newLang) {
    lang2 = newLang;
  }

  void setInput(String newInput) {
    input = newInput;
  }

  void setOutput(String newOutput) {
    input = newOutput;
  }

  Translation.fromJson(Map<String, dynamic> json)
      : input = json['input'],
        lang1 = json['lang1'],
        output = json['output'],
        lang2 = json['lang2'];

  Map<String, dynamic> toJson() => {
    'input': input,
    'lang1': lang1,
    'output': output,
    'lang2': lang2
  };

  Future<http.Response> postTranslation() {
    return http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "text": input,
        "src": lang1,
        "tgt": lang2,
        "domain": "general",
        "application": "Mobile translator NLP"

      }),
    );
  }

  Future<Translation> getTranslation() async {
    final response = await http
        .get(Uri.parse('https://api.tartunlp.ai/translation/v2'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      return Translation.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load translation');
    }
  }

}