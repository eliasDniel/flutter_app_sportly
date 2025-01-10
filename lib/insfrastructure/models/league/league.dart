
import 'area.dart';
import 'curren_season.dart';
import 'season.dart';

class League {
  final int id;
  final String name;
  final String code;
  final String type;
  final String emblem;
  final Area area;
  final CurrentSeason currentSeason;
  final List<Season> seasons;
  final String lastUpdated;

  League({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.emblem,
    required this.area,
    required this.currentSeason,
    required this.seasons,
    required this.lastUpdated,
  });

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['id'],
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      type: json['type'] ?? '',
      emblem: json['emblem'] ?? '',
      area: Area.fromJson(json['area']),
      currentSeason: CurrentSeason.fromJson(json['currentSeason']),
      seasons:
          (json['seasons'] as List).map((e) => Season.fromJson(e)).toList(),
      lastUpdated: json['lastUpdated'] ?? '',
    );
  }
}
