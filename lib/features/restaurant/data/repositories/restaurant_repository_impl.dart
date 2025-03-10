import '../graphql/query.dart';
import '../models/restaurant.dart';
import '../../domain/repositories/restaurant_repository.dart';
import '../static/restaurant_mock_data.dart';
import 'package:restaurant_tour/core/utils/logger.dart';
import 'package:restaurant_tour/core/network/api_client.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final ApiClient _apiClient;

  RestaurantRepositoryImpl(this._apiClient);

  @override
  Future<List<Restaurant>> fetchRestaurants(int offset) async {
    try {
      final response = await _apiClient.postRequest(query(offset));

      // Check if the API returned an error
      if (response.containsKey('errors')) {
        final errorMessage =
            response['errors'][0]['message'] ?? 'Unknown GraphQL error';
        throw Exception("GraphQL Error: $errorMessage");
      }

      // Ensure response contains expected structure
      if (!response.containsKey('data') ||
          !response['data'].containsKey('search')) {
        throw Exception("Invalid API response: Missing 'search' key");
      }
      List<dynamic> data = response['data']['search']['business'];
      return data.map((json) => Restaurant.fromJson(json)).toList();
    } catch (e) {
      AppLogger.logError("HTTP Error: $e", error: e);
      return _fetchMockRestaurants();
    }
  }

  /// Load static mock data if API request fails
  List<Restaurant> _fetchMockRestaurants() {
    AppLogger.logInfo("Using static data due to API failure.");
    List<dynamic> data = mockRestaurantResponse['data']['search']['business'];
    return data.map((json) => Restaurant.fromJson(json)).toList();
  }
}
