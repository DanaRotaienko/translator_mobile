class TranslationDto {
  final int? id;
  final String source;
  final String target;
  final String input;
  final String output;

  TranslationDto(
      { this.id,
        required this.source,
        required this.target,
        required this.input,
        required this.output});

  factory TranslationDto.fromMap(Map<String, dynamic> json) => TranslationDto(
    id: json['id'],
    source: json['source'],
    target: json['target'],
    input: json['input'],
    output: json['output'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'source': source,
      'target': target,
      'input': input,
      'output': output};
  }
}

