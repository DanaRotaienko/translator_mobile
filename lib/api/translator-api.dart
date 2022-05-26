import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/translation.dart';

class TranslatorApi {
  static Future<String>? fetchTranslation(Translation translation) async {
    Map<String, String> requestBody = Map();
    requestBody["text"] = translation.input;
    requestBody["src"] = translation.lang1;
    requestBody["tgt"] = translation.lang2;
    requestBody["domain"] = "general";
    String json = jsonEncode(requestBody);


    http.Response response = await http.post(
        Uri.https('api.tartunlp.ai', '/translation/v2'),
        headers: {
          "Content-Type": "application/json"
        },
        body: json);
    final codeUnits = response.body.codeUnits;
    Map<String, dynamic> responseMap = jsonDecode(Utf8Decoder().convert(codeUnits));
    return responseMap["result"];
  }
}