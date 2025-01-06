import 'package:flutter/material.dart';
import 'package:flutter_app_sportly/data/torneo_data.dart';
import 'package:flutter_app_sportly/insfrastructure/models/torneo.dart';

class TorneoProvider extends ChangeNotifier {
  List<Torneo> listaTorneo = [];

  void obtenerTorneo() {
    if (listaTorneo.isNotEmpty) return;
    listaTorneo = dataListTorneo.map((torneo) => Torneo.fromJson(torneo)).toList();
  }
}
