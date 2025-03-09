import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import '../../data/models/restaurant.dart';

class RestaurantListItem extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantListItem({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(restaurant.name ?? ""),
        subtitle: Text(restaurant.location?.formattedAddress ?? ""),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          GoRouter.of(context).pushNamed(
            AppRoutes.restaurantDetails.name,
            extra: restaurant,
          );
        },
      ),
    );
  }
}
