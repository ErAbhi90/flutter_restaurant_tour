import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/core/utils/logger.dart';
import '../../../data/models/restaurant.dart';
import '../../../domain/use_cases/fetch_restaurants.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final FetchRestaurants _fetchRestaurants;

  RestaurantBloc(this._fetchRestaurants) : super(RestaurantInitial()) {
    on<FetchRestaurantsEvent>((event, emit) async {
      emit(RestaurantLoading());
      try {
        final restaurants = await _fetchRestaurants.execute(event.offset);
        emit(RestaurantLoaded(restaurants));
      } catch (e, stackTrace) {
        AppLogger.logError(
          "RestaurantBloc Error: $e",
          error: e,
          stackTrace: stackTrace,
        );
        emit(RestaurantError("Failed to fetch restaurants: $e"));
      }
    });
  }
}
