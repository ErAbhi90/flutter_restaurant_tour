import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    AppLogger.logInfo('Bloc Created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    AppLogger.logInfo('Bloc Event: ${bloc.runtimeType} -> $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLogger.logInfo('Bloc Change: ${bloc.runtimeType} -> $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    AppLogger.logInfo('Bloc Transition: ${bloc.runtimeType} -> $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLogger.logError(
      'Bloc Error in ${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    AppLogger.logInfo('Bloc Closed: ${bloc.runtimeType}');
  }
}
