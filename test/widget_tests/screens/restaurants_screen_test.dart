import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/constants/app_strings.dart';
import 'package:restaurant_tour/features/restaurant/presentation/blocs/restaurant/restaurant_bloc.dart';
import 'package:restaurant_tour/features/restaurant/presentation/cubits/favourite_restaurants/favourite_restaurants_cubit.dart';
import 'package:restaurant_tour/features/restaurant/presentation/screens/restaurants_screen.dart';

import '../../mocks.dart';

void main() {
  late MockRestaurantBloc mockRestaurantBloc;
  late MockFavoriteRestaurantsCubit mockFavoriteRestaurantsCubit;

  setUp(() {
    mockRestaurantBloc = MockRestaurantBloc();
    mockFavoriteRestaurantsCubit = MockFavoriteRestaurantsCubit();

    when(() => mockRestaurantBloc.state).thenReturn(RestaurantInitial());
    when(() => mockRestaurantBloc.stream)
        .thenAnswer((_) => const Stream.empty());

    when(() => mockFavoriteRestaurantsCubit.state)
        .thenReturn(FavoriteRestaurantsInitial());
    when(() => mockFavoriteRestaurantsCubit.stream)
        .thenAnswer((_) => const Stream.empty());
  });

  Widget buildTestableWidget(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestaurantBloc>.value(value: mockRestaurantBloc),
        BlocProvider<FavoriteRestaurantsCubit>.value(
          value: mockFavoriteRestaurantsCubit,
        ),
      ],
      child: MaterialApp(home: child),
    );
  }

  group('RestaurantsScreen Widget Tests', () {
    testWidgets('Render RestaurantsScreen with correct tabs',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(const RestaurantsScreen()));

      expect(find.byType(TabBar), findsOneWidget);
      expect(find.text(AppStrings.allRestaurants), findsOneWidget);
      expect(find.text(AppStrings.myFavorites), findsOneWidget);
    });

    testWidgets('Display All Restaurants tab by default',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(const RestaurantsScreen()));

      expect(find.text(AppStrings.allRestaurants), findsOneWidget);
      expect(find.text(AppStrings.myFavorites), findsOneWidget);

      expect(find.byType(DefaultTabController), findsOneWidget);
      expect(find.byType(TabBarView), findsOneWidget);
    });

    testWidgets(
        'Switch to FavoriteRestaurantsScreen when My Favorites tab is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(const RestaurantsScreen()));

      await tester.tap(find.text('My Favorites'));
      await tester.pump(
        const Duration(
          milliseconds: 300,
        ),
      );

      expect(find.text('My Favorites'), findsOneWidget);
    });

    testWidgets('Maintain state when switching between tabs',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(const RestaurantsScreen()));

      await tester.tap(find.text('My Favorites'));
      await tester.pump(const Duration(milliseconds: 500));

      await tester.tap(find.text('All Restaurants'));
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('All Restaurants'), findsOneWidget);
      expect(find.text('My Favorites'), findsOneWidget);
    });

    testWidgets('Should have AppBar with correct title',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(const RestaurantsScreen()));

      expect(find.text(AppStrings.appTitle), findsOneWidget);
    });

    testWidgets('Render TabBarView with correct screens',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(const RestaurantsScreen()));

      expect(find.byType(TabBarView), findsOneWidget);
    });
  });
}
