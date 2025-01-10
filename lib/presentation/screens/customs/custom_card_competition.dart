import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../insfrastructure/models/league/competition_element.dart';

class CustomCompetition extends StatelessWidget {
  const CustomCompetition({
    super.key,
    required this.competition,
    required this.isSelected,
  });

  final CompetitionElement competition;
  final bool isSelected; // Indica si está seleccionada

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[50] : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: isSelected
              ? Colors.blue
              : Colors.black38, // Bordes azules si está seleccionada
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            competition.emblem.endsWith('.svg')
                ? SvgPicture.network(
                    competition.emblem,
                    placeholderBuilder: (context) =>
                        const CircularProgressIndicator(),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    competition.emblem,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error, color: Colors.red);
                    },
                  ),
            const SizedBox(height: 5),
            Text(
              competition.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}