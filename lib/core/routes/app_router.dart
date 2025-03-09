import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_tour/features/restaurant/presentation/screens/restaurants_screen.dart';

import '../../features/restaurant/data/models/restaurant.dart';
import '../../features/restaurant/presentation/screens/restaurant_details_screen.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.restaurants.path,
      name: AppRoutes.restaurants.name,
      builder: (context, state) => const RestaurantsScreen(),
    ),
    GoRoute(
      path: AppRoutes.restaurantDetails.path,
      name: AppRoutes.restaurantDetails.name,
      builder: (context, state) {
        final restaurant = state.extra as Restaurant;
        return RestaurantDetailsScreen(restaurant: restaurant);
      },
    ),
    GoRoute(
      path: AppRoutes.favoriteRestaurants.path,
      name: AppRoutes.favoriteRestaurants.name,
      builder: (context, state) => const Placeholder(),
    ),
  ],
);
