import 'package:final_project/models/translation.dart';

class SavedTranslationsList {
  List<Translation> savedTranslations = [];

  SavedTranslationsList([List<Translation>? list]);

  void addSavedTranslation(Translation translation) {
    savedTranslations.add(translation);
  }

  void removeSavedTranslation(Translation translation) {
    savedTranslations.remove(translation);
  }

}