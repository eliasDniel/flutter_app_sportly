import 'package:flutter_app_sportly/insfrastructure/models/partido.dart';

class Torneo {
  String? id; // Identificador único del torneo
  String? nombre; // Ej: "UEFA Champions League"
  String? logoTorneo; // URL o ruta del logo del torneo
  String? descripcion; // Ej: "UEFA Champions League, ROUND OF 16 - 2nd Leg"
  List<Partido>? partidos;

  Torneo({
    required this.id,
    required this.nombre,
    required this.logoTorneo,
    required this.descripcion,
    required this.partidos,
  });

  // Método copyWith
  Torneo copyWith({
    String? id,
    String? nombre,
    String? logoTorneo,
    String? descripcion,
    List<Partido>? partidos,
  }) {
    return Torneo(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      logoTorneo: logoTorneo ?? this.logoTorneo,
      descripcion: descripcion ?? this.descripcion,
      partidos: partidos ?? this.partidos,
    );
  }

  // Convertir de JSON al modelo
  factory Torneo.fromJson(Map<String, dynamic> json) {
    return Torneo(
      id: json['id'] as String?,
      nombre: json['nombre'] as String?,
      logoTorneo: json['logoTorneo'] as String?,
      descripcion: json['descripcion'] as String?,
      partidos: (json['partidos'] as List<dynamic>?)
          ?.map((partido) => Partido.fromJson(partido as Map<String, dynamic>))
          .toList(),
    );
  }

  // Convertir de modelo a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'logoTorneo': logoTorneo,
      'descripcion': descripcion,
      'partidos': partidos?.map((partido) => partido.toJson()).toList(),
    };
  }
}
