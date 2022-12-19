import 'package:flutter/material.dart';
import 'package:marvel_characters/di/service_locator.dart';
import 'package:marvel_characters/router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = ServiceLocator.injector<AppRouter>();

    return MaterialApp.router(
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
