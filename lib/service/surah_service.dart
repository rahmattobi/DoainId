// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:quranku/model/surah_model.dart';

class SurahService {
  static const String url =
      'https://al-quran-8d642.firebaseio.com/data.json?print=pretty';

  static Future<List<Surah>?> getSurah() async {
    List<Surah> surah = [];
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<Surah> surahs = surahFromJson(response.body);
        print(response.body);
        return surahs;
      } else {
        print('data tidak di temukan');
        return surah;
      }
    } catch (e) {
      return surah;
    }
  }
}
