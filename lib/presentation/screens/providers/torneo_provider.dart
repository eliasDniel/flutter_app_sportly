import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sportly/data/torneo_data.dart';
import 'package:flutter_app_sportly/insfrastructure/models/competition.dart';
import 'package:flutter_app_sportly/insfrastructure/models/league.dart';
import 'package:flutter_app_sportly/insfrastructure/models/torneo.dart';

import '../../../insfrastructure/models/match.dart';

class TorneoProvider extends ChangeNotifier {
  final dio =
      Dio(BaseOptions(baseUrl: 'https://api.football-data.org/v4', headers: {
    'X-Auth-Token': "0217b02d9bc24f4c94d74e196cd6c72f",
  }));

  List<Torneo> listaTorneo = [];
  List<CompetitionElement> listaCompeticiones = [];
  bool isloading = false;
  List<Matche> primeros3Partidos = [];

  void obtenerTorneo() {
    if (listaTorneo.isNotEmpty) return;
    listaTorneo =
        dataListTorneo.map((torneo) => Torneo.fromJson(torneo)).toList();
  }

  Future<void> obtenerCompetitions() async {
    if (listaCompeticiones.isNotEmpty) return;
    isloading = true;
    try {
      final response = await dio.get('/competitions');
      final competitionResponse = Competition.fromJson(response.data);
      listaCompeticiones = competitionResponse.competitions;
      isloading = false;
      notifyListeners();
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        print(
            'Límite de solicitudes alcanzado. Por favor, verifica tu API token o intenta más tarde.');
      } else {
        print('Error: ${e.response?.statusCode} ${e.response?.statusMessage}');
      }
    } catch (e) {
      print('Unknown Error: $e');
    }
  }

  Future<League> obtenerLeague(String code) async {
    final response = await dio.get('/competitions/$code');
    final competitionResponse = League.fromJson(response.data);
    await obtenerPrimerosPartidos(code);
    isloading = false;
    notifyListeners(); // This will ensure the UI updates when the seasons data is fetched
    return competitionResponse;
  }

  Future<void> obtenerPrimerosPartidos(String code) async {
    isloading = true;
    try {
      final response = await dio.get('/competitions/$code/matches');
      final competitionResponse = MatchesResponse.fromJson(response.data);
      primeros3Partidos = competitionResponse.matches.where((element) => element.status == 'TIMED',).take(3).toList();
      isloading = false;
      notifyListeners();
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        print(
            'Límite de solicitudes alcanzado. Por favor, verifica tu API token o intenta más tarde.');
      } else {
        print('Error: ${e.response?.statusCode} ${e.response?.statusMessage}');
      }
    } catch (e) {
      print('Unknown Error: $e');
    }
  }
}
