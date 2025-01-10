import 'area.dart';
import 'curren_season.dart';

class CompetitionElement {
    final int id;
    final Area area;
    final String name;
    final String code;
    final String type;
    final String emblem;
    final String plan;
    final CurrentSeason currentSeason;
    final int numberOfAvailableSeasons;
    final String lastUpdated;

    CompetitionElement({
        required this.id,
        required this.area,
        required this.name,
        required this.code,
        required this.type,
        required this.emblem,
        required this.plan,
        required this.currentSeason,
        required this.numberOfAvailableSeasons,
        required this.lastUpdated,
    });

    factory CompetitionElement.fromJson(Map<String, dynamic> json) => CompetitionElement(
        id: json["id"] ?? 0,
        area: Area.fromJson(json["area"] ?? {}),
        name: json["name"] ?? '',
        code: json["code"] ?? '',
        type: json["type"] ?? '',
        emblem: json["emblem"] ?? '',
        plan: json["plan"] ?? '',
        currentSeason: CurrentSeason.fromJson(json["currentSeason"] ?? {}),
        numberOfAvailableSeasons: json["numberOfAvailableSeasons"] ?? 0,
        lastUpdated: json["lastUpdated"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "area": area.toJson(),
        "name": name,
        "code": code,
        "type": type,
        "emblem": emblem,
        "plan": plan,
        "currentSeason": currentSeason.toJson(),
        "numberOfAvailableSeasons": numberOfAvailableSeasons,
        "lastUpdated": lastUpdated,
    };
}