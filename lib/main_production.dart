import 'package:flutter/material.dart';

import 'app_flavor.dart';
import 'bootstrap.dart';
import 'common/di/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocatorInitializer.initWithFlavor(AppFlavor.staging);

  initializeFlutterApp();
}
