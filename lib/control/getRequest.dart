import 'package:http/http.dart' as http;

class GetRequest {
  static String url = "https://streakhub-backend.onrender.com/connect/1";

  static Future<String> get() async {
    var response = await http.get(Uri.parse(url));
    print(response.body);
    return response.body;
  }
}
