class Referee {
  final int id;
  final String name;
  final String type;
  final String? nationality;

  Referee({
    required this.id,
    required this.name,
    required this.type,
    this.nationality,
  });
  

  factory Referee.fromJson(Map<String, dynamic> json) {
    return Referee(
      id: json['id'] ?? 0, // Valor predeterminado: 0
      name: json['name'] ?? 'Unknown', // Valor predeterminado: 'Unknown'
      type: json['type'] ?? 'Unknown', // Valor predeterminado: 'Unknown'
      nationality: json['nationality'] ?? 'Unknown', // Valor predeterminado: 'Unknown'
    );
  }
  
}