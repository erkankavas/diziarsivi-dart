import 'package:http/http.dart' as http;

class Api {
  static Future getArticles() {
    return http.get(
      Uri.parse("https://www.diziarsivi.com/json.php"),
    );
  }
}
