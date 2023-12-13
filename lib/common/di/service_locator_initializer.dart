part of 'service_locator.dart';

abstract interface class ServiceLocatorInitializer {
  ServiceLocatorInitializer._();

  static void initWithFlavor(AppFlavor flavor) {
    _configureAppModule(flavor);
    _configureNetworkModule(flavor);
  }

  static void _configureNetworkModule(AppFlavor flavor) {
    final dioClient = DioClient(baseUrl: flavor.baseUrl);

    ServiceLocator.registerSingleton(dioClient);
    ServiceLocator.registerLazySingleton<ICityApi>(() => CityApi(dioClient.dio));
    ServiceLocator.registerSingleton<CityRepository>(
        CityRepositoryImpl(ServiceLocator.inject()));
  }

  static void _configureAppModule(AppFlavor flavor) {
    ServiceLocator.registerLazySingleton<Logger>(() {
      final Logger logger = DebugLogger();
      return logger;
    });
  }

// todo...
}
