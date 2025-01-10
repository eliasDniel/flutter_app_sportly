import 'package:flutter/material.dart';
import '../../screens/providers/torneo_provider.dart';
import 'custom_match_details.dart';

class CustomListarPartidos extends StatelessWidget {
  final TorneoProvider torneoProvider;
  const CustomListarPartidos({super.key, required this.torneoProvider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: torneoProvider.primeros3Partidos.length,
      itemBuilder: (context, index) {
        final partido = torneoProvider.primeros3Partidos[index];
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: CustomPartidoMath(partido: partido));
      },
    );
  }
}