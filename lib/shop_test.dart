import 'package:http/http.dart' as http;

void main(List<String> args) async {
  Uri baseURL = Uri.parse("http://localhost:4040/categories");
  final response = await http.get(baseURL);
  print(response.body.runtimeType);
}
