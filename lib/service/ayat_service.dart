import 'package:http/http.dart' as http;
import 'package:quranku/model/ayat_model.dart';

class AyatService {
  static const String url = 'https://api.npoint.io/99c279bb173a6e28359c/surat/';

  Future<List<Ayat>?> getAyat() async {
    List<Ayat> ayat = [];
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<Ayat> ayats = ayatFromJson(response.body);
        print(response.body);
        return ayats;
      } else {
        print('data tidak di temukan');
        return ayat;
      }
    } catch (e) {
      return ayat;
    }
  }
}
