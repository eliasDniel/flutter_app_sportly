import 'winner.dart';

class CurrentSeason {
    final int id;
    final String startDate;
    final String endDate;
    final int currentMatchday;
    final Winner? winner;

    CurrentSeason({
        required this.id,
        required this.startDate,
        required this.endDate,
        required this.currentMatchday,
        required this.winner,
    });

    factory CurrentSeason.fromJson(Map<String, dynamic> json) => CurrentSeason(
        id: json["id"] ?? 0,
        startDate: json["startDate"] ?? '',
        endDate: json["endDate"] ?? '',
        currentMatchday: json["currentMatchday"] ?? 0,
        winner: json["winner"] == null ? null : Winner.fromJson(json["winner"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "startDate": startDate,
        "endDate": endDate,
        "currentMatchday": currentMatchday,
        "winner": winner?.toJson(),
    };
}