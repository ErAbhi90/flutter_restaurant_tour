import 'package:flutter/material.dart';
import '../../data/models/restaurant.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailsScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name ?? "Restaurant"),
      ),
      body: const Center(
        child: Text("Restaurant Details screen"),
      ),
    );
  }
}
