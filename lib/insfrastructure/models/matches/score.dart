

import 'fulltime.dart';

class Score {
  final String winner;
  final String duration;
  final FullTime fullTime;

  Score({
    required this.winner,
    required this.duration,
    required this.fullTime,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      winner: json['winner'] ?? 'Unknown', // Valor predeterminado: 'Unknown'
      duration: json['duration'] ?? 'Unknown', // Valor predeterminado: 'Unknown'
      fullTime: FullTime.fromJson(json['fullTime'] ?? {}),
    );
  }
}