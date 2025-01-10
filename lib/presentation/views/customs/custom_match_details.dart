import 'package:flutter/material.dart';
import '../../../insfrastructure/models/matches/match.dart';

class CustomPartidoMath extends StatelessWidget {
  const CustomPartidoMath({
    super.key,
    required this.partido,
  });

  final Matche partido;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff222232), borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(children: [
                Expanded(
                  child: Text(
                    partido.homeTeam.shortName.length > 10
                        ? partido.homeTeam.shortName.substring(0, 7)
                        : partido.homeTeam.shortName.padRight(7),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 13),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.network(
                  partido.homeTeam.crest,
                  height: 40,
                  width: 40,
                )
              ])),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    partido.formattedDate,
                    style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500 ),
                  ),
                  Text(
                    partido.status,
                    style: const TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.w500),
                  )
                ]
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Row(
                children: [
                  Image.network(
                    partido.awayTeam.crest,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    partido.awayTeam.shortName.length > 10
                        ? partido.awayTeam.shortName.substring(0, 7)
                        : partido.awayTeam.shortName.padRight(7),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}