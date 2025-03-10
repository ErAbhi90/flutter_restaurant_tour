import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/core/di/service_locator.dart';
import 'package:restaurant_tour/core/network/api_client.dart';
import 'package:restaurant_tour/core/utils/logger.dart';
import 'package:restaurant_tour/features/restaurant/data/repositories/restaurant_repository_impl.dart';
import 'package:restaurant_tour/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/fetch_restaurants.dart';
import 'package:restaurant_tour/features/restaurant/presentation/blocs/restaurant/restaurant_bloc.dart';

void main() {
  final getIt = GetIt.instance;

  setUp(() async {
    await getIt.reset();
    await setupLocator();
  });

  test('should register AppLogger', () {
    expect(getIt<AppLogger>(), isA<AppLogger>());
  });

  test('should register ApiClient', () {
    expect(getIt<ApiClient>(), isA<ApiClient>());
  });

  test('should register RestaurantRepository', () {
    expect(getIt<RestaurantRepository>(), isA<RestaurantRepositoryImpl>());
  });

  test('should register FetchRestaurants use case', () {
    expect(getIt<FetchRestaurants>(), isA<FetchRestaurants>());
  });

  test('should register RestaurantBloc', () {
    expect(getIt<RestaurantBloc>(), isA<RestaurantBloc>());
  });
}
