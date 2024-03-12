// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'app_flavor.dart';
import 'bootstrap.dart';
import 'common/di/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocatorInitializer.initWithFlavor(AppFlavor.staging);

  initializeFlutterApp();
}
