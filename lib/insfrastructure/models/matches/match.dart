
import 'package:intl/intl.dart';

import 'referee.dart';
import 'score.dart';
import 'team.dart';

class Matche {
  final int id;
  final String utcDate;
  final String status;
  final int matchday;
  final String stage;
  final Team homeTeam;
  final Team awayTeam;
  final Score score;
  final List<Referee> referees;

  Matche({
    required this.id,
    required this.utcDate,
    required this.status,
    required this.matchday,
    required this.stage,
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
    required this.referees,
  });

  String get formattedDate {
    DateTime parsedDate =
        DateTime.parse(utcDate); // Convierte el string ISO en DateTime
    return DateFormat('d MMM y').format(parsedDate); // Formato "25 SEP 2025"
  }

  factory Matche.fromJson(Map<String, dynamic> json) {
    return Matche(
      id: json['id'] ?? 0, // Valor predeterminado: 0
      utcDate: json['utcDate'] ?? 'N/A', // Valor predeterminado: 'N/A'
      status: json['status'] ?? 'Unknown', // Valor predeterminado: 'Unknown'
      matchday: json['matchday'] ?? 0, // Valor predeterminado: 0
      stage: json['stage'] ?? 'Unknown', // Valor predeterminado: 'Unknown'
      homeTeam: Team.fromJson(json['homeTeam'] ?? {}),
      awayTeam: Team.fromJson(json['awayTeam'] ?? {}),
      score: Score.fromJson(json['score'] ?? {}),
      referees: (json['referees'] as List?)
              ?.map((referee) => Referee.fromJson(referee))
              .toList() ??
          [], // Valor predeterminado: lista vacía
    );
  }
}
