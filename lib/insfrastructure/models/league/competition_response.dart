import 'competition_element.dart';

class CompetitionResponse {
    final int count;
    final List<CompetitionElement> competitions;

    CompetitionResponse({
        required this.count,
        required this.competitions,
    });

    factory CompetitionResponse.fromJson(Map<String, dynamic> json) => CompetitionResponse(
        count: json["count"] ?? 0,
        competitions: List<CompetitionElement>.from(
            (json["competitions"] ?? []).map((x) => CompetitionElement.fromJson(x))
        ),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "competitions": List<dynamic>.from(competitions.map((x) => x.toJson())),
    };
}
