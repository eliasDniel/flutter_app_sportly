class FullTime {
  final int home;
  final int away;

  FullTime({
    required this.home,
    required this.away,
  });

  factory FullTime.fromJson(Map<String, dynamic> json) {
    return FullTime(
      home: json['home'] ?? 0, // Valor predeterminado: 0
      away: json['away'] ?? 0, // Valor predeterminado: 0
    );
  }
}