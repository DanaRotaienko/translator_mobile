class Translation {
  String lang1;
  String lang2;
  String input;
  String output;

  Translation(this.lang1, this.lang2, this.input, this.output);

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

  void getTranslation() {

  }

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      json['lang1'],
      json['lang2'],
      json['input'],
      json['output'],
    );
  }

  Future<Translation> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  void postForTranslation() {

  }
}