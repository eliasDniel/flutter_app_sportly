

import '../league/competition_response.dart';
import 'match.dart';
import 'result_match.dart';

class MatchesResponse {
  final Map<String, dynamic> filters;
  final ResultSet resultSet;
  final CompetitionResponse competition;
  final List<Matche> matches;

  MatchesResponse({
    required this.filters,
    required this.resultSet,
    required this.competition,
    required this.matches,
  });

  factory MatchesResponse.fromJson(Map<String, dynamic> json) {
    return MatchesResponse(
      filters: json['filters'],
      resultSet: ResultSet.fromJson(json['resultSet']),
      competition: CompetitionResponse.fromJson(json['competition']),
      matches: (json['matches'] as List)
          .map((matchJson) => Matche.fromJson(matchJson))
          .toList(),
    );
  }
}