import 'package:intl/intl.dart';
import 'winner.dart';

class Season {
  final int id;
  final String startDate;
  final String endDate;
  final int currentMatchday;
  final Winner? winner;

  Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
    this.winner,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      id: json['id'],
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      currentMatchday: json['currentMatchday'] ?? 0,
      winner: json['winner'] != null ? Winner.fromJson(json['winner']) : null,
    );
  }
  String formattedDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      final formattedDate = DateFormat("d MMMM yyyy", 'es').format(parsedDate);
      return formattedDate;
    } catch (e) {
      return date;
    }
  }
}