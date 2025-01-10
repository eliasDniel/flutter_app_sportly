import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../config/constants/variable_entorno.dart';
import '../../../insfrastructure/models/league/competition_element.dart';
import '../../../insfrastructure/models/league/competition_response.dart';
import '../../../insfrastructure/models/league/league.dart';
import '../../../insfrastructure/models/matches/match.dart';
import '../../../insfrastructure/models/matches/matches_response.dart';

class TorneoProvider extends ChangeNotifier {
  List<CompetitionElement> listaCompeticiones = [];
  bool isloading = false;
  List<Matche> primeros3Partidos = [];

  // METODO PARA LA OBTENCION DE LAS LIGAS O COMPETICIONES DE FUTBOL
  Future<void> obtenerCompetitions() async {
    if (listaCompeticiones.isNotEmpty) return;
    isloading = true;
    try {
      final response = await dio.get('/competitions');
      final competitionResponse = CompetitionResponse.fromJson(response.data);
      listaCompeticiones = competitionResponse.competitions;
      isloading = false;
      notifyListeners();
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        debugPrint('Límite de solicitudes alcanzado. Por favor, verifica tu API token o intenta más tarde.');
      } else {
        debugPrint('Error: ${e.response?.statusCode} ${e.response?.statusMessage}');
      }
    } catch (e) {
      debugPrint('Unknown Error: $e');
    }
  }


  // METODO PARA UNA LIGA POR EL CODE
  Future<League> obtenerLeague(String code) async {
    final response = await dio.get('/competitions/$code');
    final competitionResponse = League.fromJson(response.data);
    await obtenerPrimerosPartidos(code);
    isloading = false;
    notifyListeners(); // This will ensure the UI updates when the seasons data is fetched
    return competitionResponse;
  }


  // METODO PARA OBTENER LOS 3 PRIMEROS PARTIDOS POR JUGARSE
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
        debugPrint('Límite de solicitudes alcanzado. Por favor, verifica tu API token o intenta más tarde.');
      } else {
        debugPrint('Error: ${e.response?.statusCode} ${e.response?.statusMessage}');
      }
    } catch (e) {
      debugPrint('Unknown Error: $e');
    }
  }
}
