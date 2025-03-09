import 'package:flutter/material.dart';
import 'package:restaurant_tour/features/restaurant/presentation/screens/favourite_restaurants_screen.dart';
import 'package:restaurant_tour/features/restaurant/presentation/screens/restaurants_list_screen.dart';
import 'package:restaurant_tour/core/constants/app_strings.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appTitle),
          bottom: const TabBar(
            tabs: [
              Tab(text: AppStrings.allRestaurants),
              Tab(text: AppStrings.myFavorites),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RestaurantsListScreen(),
            FavoriteRestaurantsScreen(),
          ],
        ),
      ),
    );
  }
}
