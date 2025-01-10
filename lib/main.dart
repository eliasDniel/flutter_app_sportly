import 'package:flutter/material.dart';
import 'package:flutter_app_sportly/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async{
  await dotenv.load(fileName: '.env');
  runApp(
    const ProviderScope(child: MainApp() )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff171A28), // Fondo negro
        primarySwatch: Colors.blue, // Puedes definir un color primario si lo necesitas
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Texto en blanco por defecto
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
