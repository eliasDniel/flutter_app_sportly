class Winner {
    final int id;
    final String name;
    final String shortName;
    final String tla;
    final String crest;
    final String address;
    final String website;
    final int founded;
    final String clubColors;
    final String venue;
    final String lastUpdated;

    Winner({
        required this.id,
        required this.name,
        required this.shortName,
        required this.tla,
        required this.crest,
        required this.address,
        required this.website,
        required this.founded,
        required this.clubColors,
        required this.venue,
        required this.lastUpdated,
    });

    factory Winner.fromJson(Map<String, dynamic> json) => Winner(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        shortName: json["shortName"] ?? '',
        tla: json["tla"] ?? '',
        crest: json["crest"] ?? '',
        address: json["address"] ?? '',
        website: json["website"] ?? '',
        founded: json["founded"] ?? 0,
        clubColors: json["clubColors"] ?? '',
        venue: json["venue"] ?? '',
        lastUpdated: json["lastUpdated"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shortName": shortName,
        "tla": tla,
        "crest": crest,
        "address": address,
        "website": website,
        "founded": founded,
        "clubColors": clubColors,
        "venue": venue,
        "lastUpdated": lastUpdated,
    };
}
