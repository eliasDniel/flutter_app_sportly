class Area {
    final int id;
    final String name;
    final String code;
    final String flag;

    Area({
        required this.id,
        required this.name,
        required this.code,
        required this.flag,
    });

    factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        code: json["code"] ?? '',
        flag: json["flag"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "flag": flag,
    };
}