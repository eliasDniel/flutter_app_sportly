import 'package:flutter/material.dart';
import '../../../insfrastructure/models/league/season.dart';
import '../../../insfrastructure/models/league/winner.dart';

class Slide extends StatelessWidget {
  final Season season;
  final Winner winner;
  final bool isActive;

  const Slide({super.key, 
    required this.winner,
    required this.season,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: isActive ? null : const Color(0xff222232), // Fondo dinámico
      gradient: isActive
          ? const LinearGradient(
              colors: [
                Color(0xFF6D5DF6), // Azul-violeta
                Color(0xFF836DF4), // Intermedio (violeta más claro)
                Color(0xFFAD48F0), // Rosa
                Color(0xFF6D5DF6), // Regresa al azul-violeta
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          : null,
      image: isActive
          ? const DecorationImage(
              image: NetworkImage(
                'https://d33wubrfki0l68.cloudfront.net/b4759e96fa9ada8ee8caa4c771fcd503f289d791/6de77/static/triangle_background-9df4fa2e10f0e294779511e99083c2bc.jpg',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black26, // Color semitransparente sobre la imagen
                BlendMode.darken,
              ),
            )
          : null,
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  winner.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white24,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 15),
                                      child: Text(
                                        winner.tla,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${winner.venue} ${winner.founded}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              'Temporada',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '${season.formattedDate(season.startDate)} / ${season.formattedDate(season.endDate)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 5),
              child: FadeInImage(
                height: 100,
                fit: BoxFit.cover,
                placeholder: const AssetImage(
                  'assets/loaders/bottle-loader.gif',
                ),
                image: NetworkImage(winner.crest),
              ),
            ),
          ],
        ),
      ),
    );
  }
}