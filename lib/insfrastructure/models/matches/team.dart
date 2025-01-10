class Team {
  final int id;
  final String name;
  final String shortName;
  final String tla;
  final String crest;

  Team({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'] ?? 0, // Valor predeterminado: 0
      name: json['name'] ?? 'Unknown', // Valor predeterminado: 'Unknown'
      shortName: json['shortName'] ?? 'Unknown', // Valor predeterminado: 'Unknown'
      tla: json['tla'] ?? 'N/A', // Valor predeterminado: 'N/A'
      crest: json['crest'] ?? 'default_url', // Valor predeterminado: URL por defecto
    );
  }
}
