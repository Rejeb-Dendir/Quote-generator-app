import 'dart:convert';

import 'package:quote_generator_app/quote_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = "https://zenquotes.io/api/";

  static Future<QuoteModel> fetchRandomQuote() async {
    try {
      final response = await http.get(Uri.parse("${baseUrl}random"));
      if (response.statusCode == 200) {
        final quoteData = json.decode(response.body);
        return QuoteModel.fromJson(quoteData[0]);
      } else {
        throw Exception("Failed to fetch quote");
      }
    }catch (e) {
      throw Exception ("Failed to generate quote");
    }
  }
}
