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
      title: 'Sportly',
      routerConfig:appRouter 
     
    );
  }
}
