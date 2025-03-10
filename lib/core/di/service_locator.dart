import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/core/network/api_client.dart';
import 'package:restaurant_tour/features/restaurant/presentation/cubits/favourite_restaurants/favourite_restaurants_cubit.dart';
import '../../features/restaurant/data/repositories/restaurant_repository_impl.dart';
import '../../features/restaurant/domain/repositories/restaurant_repository.dart';
import '../../features/restaurant/domain/use_cases/fetch_restaurants.dart';
import '../../features/restaurant/presentation/blocs/restaurant/restaurant_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton(() => ApiClient());

  // Register Repository as an Interface
  getIt.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImpl(getIt<ApiClient>()),
  );

  // Register Use Case
  getIt.registerLazySingleton(
    () => FetchRestaurants(getIt<RestaurantRepository>()),
  );

  // Register RestaurantBloc
  getIt.registerFactory<RestaurantBloc>(
    () => RestaurantBloc(getIt<FetchRestaurants>()),
  );

  // Register FavoriteRestaurantsCubit
  getIt.registerFactory<FavoriteRestaurantsCubit>(
    () => FavoriteRestaurantsCubit(),
  );
}
