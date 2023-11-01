import 'dart:convert';
import 'package:restoran_serba_ada/model/constants/open_ai.dart';
import 'package:restoran_serba_ada/model/open_ai_model.dart';
import 'package:http/http.dart' as http;

class DescriptionService {
  static Future<GptData> getDescription({
    required String menu,
  }) async {
    late GptData gptData = GptData(
      id: "",
      object: "",
      model: "",
      created: 0,
      choices: [],
      usage: Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0),
    );
    try {
      var url = Uri.parse('https://api.openai.com/v1/completions');

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey'
      };

      String promptData =
          "You are a food expert. Please give me a detail food description for this food $menu, write it in 240 character and separated to 3 paragraph";

      final data = jsonEncode({
        "model": "gpt-3.5-turbo-instruct",
        "prompt": promptData,
        "max_tokens": 260,
        "temperature": 0.4,
      });
      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      throw Exception('Request Gagal di Kirim');
    }
    return gptData;
  }
}
