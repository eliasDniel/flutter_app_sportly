import 'package:flutter/material.dart';
import 'package:flutter_app_sportly/insfrastructure/models/league/league.dart';
import 'package:flutter_app_sportly/presentation/screens/providers/consumir_provider.dart';
import 'package:flutter_app_sportly/presentation/views/customs/swiper_campeones.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'customs/custom_listar_partidos.dart';
import 'customs/squeletor.dart';// Importa el paquete shimmer

class HomeView extends ConsumerStatefulWidget {
  final String code;
  const HomeView({super.key, required this.code});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late Future<League> league;

  @override
  void initState() {
    league = ref.read(providerTorneo.notifier).obtenerLeague(widget.code);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerPartido = ref.read(providerTorneo);
    return Scaffold(
      body: FutureBuilder<League>(
        future: league,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child:CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final league = snapshot.data!;
            return ListView(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(
                          context); // This will pop the current screen and navigate back
                    },
                  ),
                  title: Text(
                    league.name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  actions: [
                    Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.network(league.emblem))
                  ],
                ),
                const SizedBox(height: 10),
                CampeonesSlideshow(seasons: league.seasons),
                const _TitleViewMatchesAll(),
                const SizedBox(height: 10),
                providerPartido.isloading
                    ? const CustomSqueletor() // Aquí mostramos el efecto shimmer
                    : CustomListarPartidos(torneoProvider: providerPartido),
              ],
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

class _TitleViewMatchesAll extends StatelessWidget {
  const _TitleViewMatchesAll();
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Match Schedule',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text('See All')
        ],
      ),
    );
  }
}