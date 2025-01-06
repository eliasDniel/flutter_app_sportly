import 'package:flutter/material.dart';
import 'package:flutter_app_sportly/config/router/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffEAECED), // Fondo negro
        primarySwatch: Colors.blue, // Puedes definir un color primario si lo necesitas
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Texto en blanco por defecto
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
