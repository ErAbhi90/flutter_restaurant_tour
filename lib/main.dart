import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:restaurant_tour/core/constants/app_strings.dart';
import 'package:restaurant_tour/core/di/service_locator.dart';
import 'package:restaurant_tour/core/routes/app_router.dart';

import 'core/theme/app_theme.dart';
import 'core/observer/bloc_observer.dart';
import 'features/restaurant/presentation/blocs/restaurant/restaurant_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  Bloc.observer = AppBlocObserver();

  await setupLocator();
  runApp(const RestaurantTour());
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestaurantBloc>(
          create: (context) =>
              getIt<RestaurantBloc>()..add(FetchRestaurantsEvent(0)),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appTitle,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: appRouter,
      ),
    );
  }
}
