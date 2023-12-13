import 'package:get_it/get_it.dart';

import '../../app_flavor.dart';
import '../../data/remote/remote.dart';
import '../../domain/domain.dart';
import '../../domain/repositories/city_repository_impl.dart';
import '../logger/impl/debug_logger.dart';
import '../logger/logger.dart';

part 'service_locator_initializer.dart';

class ServiceLocator {
  ServiceLocator._();

  static final _getIt = GetIt.instance;

  static void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? onDispose,
  }) {
    _getIt.registerSingleton<T>(
      instance,
      instanceName: instanceName,
      signalsReady: signalsReady,
      dispose: (param) {

      },
    );
  }

  static void registerSingletonAsync<T extends Object>(
    Future<T> Function() asyncInstance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? onDispose,
  }) {
    _getIt.registerSingletonAsync(
      asyncInstance,
      instanceName: instanceName,
      signalsReady: signalsReady,
      dispose: onDispose,
    );
  }

  static void registerLazySingleton<T extends Object>(
    T Function() asyncInstance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? onDispose,
  }) {
    _getIt.registerLazySingleton(
      asyncInstance,
      instanceName: instanceName,
      dispose: onDispose,
    );
  }

  static void registerLazySingletonAsync<T extends Object>(
    Future<T> Function() asyncInstance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? onDispose,
  }) {
    _getIt.registerLazySingletonAsync(
      asyncInstance,
      instanceName: instanceName,
      dispose: onDispose,
    );
  }

  static T inject<T extends Object>({String? instanceName}) =>
      _getIt.get<T>(instanceName: instanceName);

  static Future<T> injectAsync<T extends Object>({String? instanceName}) =>
      _getIt.getAsync<T>(instanceName: instanceName);
}
