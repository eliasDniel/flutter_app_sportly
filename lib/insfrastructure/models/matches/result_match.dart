class ResultSet {
  final int count;
  final String first;
  final String last;
  final int played;

  ResultSet({
    required this.count,
    required this.first,
    required this.last,
    required this.played,
  });

  factory ResultSet.fromJson(Map<String, dynamic> json) {
    return ResultSet(
      count: json['count'],
      first: json['first'],
      last: json['last'],
      played: json['played'],
    );
  }
}