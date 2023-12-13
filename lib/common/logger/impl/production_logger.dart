import 'dart:developer';

import '../logger.dart';

final class ProductionLogger implements Logger {
  @override
  void call(String message, {Object? error, StackTrace? stackTrace}) {
    log(message);
  }

  @override
  void d(String message, {Object? error, StackTrace? stackTrace}) {
    log(message);
  }

  @override
  void e(String message, {Object? error, StackTrace? stackTrace}) {
    log(message);
  }

  @override
  void i(String message, {Object? error, StackTrace? stackTrace}) {
    log(message);
  }

  @override
  void v(String message, {Object? error, StackTrace? stackTrace}) {
    log(message);
  }

  @override
  void w(String message, {Object? error, StackTrace? stackTrace}) {
    log(message);
  }

  @override
  void wtf(String message, {Object? error, StackTrace? stackTrace}) {
    log(message);
  }
}
