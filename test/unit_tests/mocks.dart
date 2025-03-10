import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_tour/core/network/api_client.dart';
import 'package:restaurant_tour/core/utils/logger.dart';
import 'package:restaurant_tour/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/fetch_restaurants.dart';
import 'package:restaurant_tour/features/restaurant/presentation/blocs/restaurant/restaurant_bloc.dart';
import 'package:restaurant_tour/features/restaurant/presentation/cubits/favourite_restaurants/favourite_restaurants_cubit.dart';

// Mock for HttpClient
class MockHttpClient extends Mock implements http.Client {}

// Mock for AppLogger
class MockAppLogger extends Mock implements AppLogger {}

// Mock for ApiClient
class MockApiClient extends Mock implements ApiClient {}

// Mock for RestaurantRepository
class MockRestaurantRepository extends Mock implements RestaurantRepository {}

// Mock for FetchRestaurants use case
class MockFetchRestaurants extends Mock implements FetchRestaurants {}

// Mock for RestaurantBloc
class MockRestaurantBloc extends Mock implements RestaurantBloc {}

// Mock for FavoriteRestaurantsCubit
class MockFavoriteRestaurantsCubit extends Mock
    implements FavoriteRestaurantsCubit {}

// Mock Storage for HydratedBloc
class MockStorage extends Mock implements Storage {}

// Fake Uri to prevent Mocktail errors
class FakeUri extends Fake implements Uri {}

// Register fallback values for Mocktail to avoid type issues
void registerMockFallbackValues() {
  registerFallbackValue(FakeUri());
}
