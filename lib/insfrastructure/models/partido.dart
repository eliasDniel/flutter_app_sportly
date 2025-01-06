class Partido {
  String? id;
  String? descripcion; // Identificador único del partido
  String? equipoLocal;
  String? imagenEquipoLocal; // URL o ruta de la imagen
  String? equipoVisitante;
  String? imagenEquipoVisitante; // URL o ruta de la imagen
  String? resultadoLocal; // Ej: "WWWWLD"
  String? resultadoVisitante; // Ej: "LWLLWW"
  String? estado; // Ej: "2nd Leg"
  String? fecha; // Ej: "Thu, 10/04"
  String? hora; // Ej: "4:00 AM"
  String? marcadorGlobal; // Ej: "Agg 0-1"
  String? marcadorResumen; // Ej: "Real Madrid leads 1-0 on aggregate"

  Partido({
    required this.id,
    required this.descripcion,
    required this.equipoLocal,
    required this.imagenEquipoLocal,
    required this.equipoVisitante,
    required this.imagenEquipoVisitante,
    required this.resultadoLocal,
    required this.resultadoVisitante,
    required this.estado,
    required this.fecha,
    required this.hora,
    required this.marcadorGlobal,
    required this.marcadorResumen,
  });

  // Método copyWith
  Partido copyWith({
    String? id,
    String? descripcion,
    String? equipoLocal,
    String? imagenEquipoLocal,
    String? equipoVisitante,
    String? imagenEquipoVisitante,
    String? resultadoLocal,
    String? resultadoVisitante,
    String? estado,
    String? fecha,
    String? hora,
    String? marcadorGlobal,
    String? marcadorResumen,
  }) {
    return Partido(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
      equipoLocal: equipoLocal ?? this.equipoLocal,
      imagenEquipoLocal: imagenEquipoLocal ?? this.imagenEquipoLocal,
      equipoVisitante: equipoVisitante ?? this.equipoVisitante,
      imagenEquipoVisitante:
          imagenEquipoVisitante ?? this.imagenEquipoVisitante,
      resultadoLocal: resultadoLocal ?? this.resultadoLocal,
      resultadoVisitante: resultadoVisitante ?? this.resultadoVisitante,
      estado: estado ?? this.estado,
      fecha: fecha ?? this.fecha,
      hora: hora ?? this.hora,
      marcadorGlobal: marcadorGlobal ?? this.marcadorGlobal,
      marcadorResumen: marcadorResumen ?? this.marcadorResumen,
    );
  }

  // Convertir de JSON al modelo
  factory Partido.fromJson(Map<String, dynamic> json) {
    return Partido(
      id: json['id'] as String?,
      descripcion: json['descripcion'] as String?,
      equipoLocal: json['equipoLocal'] as String?,
      imagenEquipoLocal: json['imagenEquipoLocal'] as String?,
      equipoVisitante: json['equipoVisitante'] as String?,
      imagenEquipoVisitante: json['imagenEquipoVisitante'] as String?,
      resultadoLocal: json['resultadoLocal'] as String?,
      resultadoVisitante: json['resultadoVisitante'] as String?,
      estado: json['estado'] as String?,
      fecha: json['fecha'] as String?,
      hora: json['hora'] as String?,
      marcadorGlobal: json['marcadorGlobal'] as String?,
      marcadorResumen: json['marcadorResumen'] as String?,
    );
  }

  // Convertir de modelo a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descripcion':descripcion,
      'equipoLocal': equipoLocal,
      'imagenEquipoLocal': imagenEquipoLocal,
      'equipoVisitante': equipoVisitante,
      'imagenEquipoVisitante': imagenEquipoVisitante,
      'resultadoLocal': resultadoLocal,
      'resultadoVisitante': resultadoVisitante,
      'estado': estado,
      'fecha': fecha,
      'hora': hora,
      'marcadorGlobal': marcadorGlobal,
      'marcadorResumen': marcadorResumen,
    };
  }
}
