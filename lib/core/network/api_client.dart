import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/config.dart';
import 'package:restaurant_tour/core/utils/logger.dart';

class ApiClient {
  Future<Map<String, dynamic>> postRequest(String query) async {
    final headers = {
      'Authorization': 'Bearer $yelpApiKey',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(
        Uri.parse(yelpGraphQLUrl),
        headers: headers,
        body: jsonEncode({"query": query}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        AppLogger.logError(
          "HTTP Error: ${response.statusCode} - ${response.body}",
        );
        throw Exception(
          "Failed to load data: ${response.statusCode} - ${response.body}",
        );
      }
    } catch (e) {
      AppLogger.logError("Network Request Failed: $e", error: e);
      throw Exception("Network Error: $e");
    }
  }
}
