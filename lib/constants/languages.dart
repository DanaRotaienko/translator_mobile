class Languages {
  static const languages = ['English', 'Estonian', 'Finnish', 'German', 'Latvian',
    'Lithuanian', 'Northern Sami', 'Russian', 'Southern Sami', 'Võro'];
  static const langCodes = ['eng', 'est', 'fin', 'ger', 'lav', 'lit', 'sme', 'rus', 'sma' ,'vro'];

  static List<String> formatedLanguages(String lang) {
    var temp = ['English', 'Estonian', 'Finnish', 'German', 'Latvian',
      'Lithuanian', 'Northern Sami', 'Russian', 'Southern Sami', 'Võro'];
    if (lang == 'English' ||
        lang == 'German' ||
        lang == 'Russian' ||
        lang == 'English' ||
        lang == 'English') {

      temp.remove('Võro');
      temp.remove('Southern Sami');
      temp.remove('Northern Sami');

    } else if (lang == 'Northern Sami' ||
        lang == 'Southern Sami' ||
        lang == 'Võro') {

      temp.remove('English');
      temp.remove('German');
      temp.remove('Latvian');
      temp.remove('Lithuanian');
      temp.remove('Russian');
    }

    return temp;
  }
}