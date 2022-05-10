import 'package:final_project/models/translations-list.dart';

import '../models/translation.dart';

Translation trans1 = Translation('English', 'German', 'dog', 'hund');
Translation trans2 = Translation('English', 'German', 'owl', 'eile');

SavedTranslationsList LangList = SavedTranslationsList([trans1, trans2]);
