import 'package:flutter/material.dart';

class WatchViews extends StatelessWidget {
  static const name = 'WatchScreen';
  const WatchViews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hola WatchScreen'),
      ),
    );
  }
}
