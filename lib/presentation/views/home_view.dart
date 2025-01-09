import 'package:flutter/material.dart';
import 'package:flutter_app_sportly/insfrastructure/models/league.dart';
import 'package:flutter_app_sportly/insfrastructure/models/match.dart';
import 'package:flutter_app_sportly/insfrastructure/models/partido.dart';
import 'package:flutter_app_sportly/insfrastructure/models/torneo.dart';
import 'package:flutter_app_sportly/presentation/screens/providers/consumir_provider.dart';
import 'package:flutter_app_sportly/presentation/screens/providers/torneo_provider.dart';
import 'package:flutter_app_sportly/presentation/views/customs/lisview_campeones.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart'; // Importa el paquete shimmer

// Ejemplo de HomeView como ConsumerStatefulWidget
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
    // ref.read(providerTorneo).obtenerPrimerosPartidos(widget.code);
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
            return const Center(child: SizedBox());
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
                MoviesSlideshow(seasons: league.seasons),
                const Padding(
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
                ),
                providerPartido.isloading
                    ? _buildShimmerEffect() // Aquí mostramos el efecto shimmer
                    : _buildMatchList(providerPartido),
              ],
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  // Método para mostrar el efecto shimmer cuando los partidos están cargando
  Widget _buildShimmerEffect() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: List.generate(
            3, // Aquí creamos 3 "partidos" para simular el efecto shimmer
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                height: 50,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Método para mostrar la lista de partidos una vez cargados
  Widget _buildMatchList(TorneoProvider providerPartido) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: providerPartido.primeros3Partidos.length,
      itemBuilder: (context, index) {
        final partido = providerPartido.primeros3Partidos[index];
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: CustomPartidoMath(partido: partido));
      },
    );
  }
}

class CustomPartidoMath extends StatelessWidget {
  const CustomPartidoMath({
    super.key,
    required this.partido,
  });

  final Matche partido;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff222232), borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(children: [
                Expanded(
                  child: Text(
                    partido.homeTeam.shortName.length > 10
                        ? partido.homeTeam.shortName.substring(0, 7)
                        : partido.homeTeam.shortName.padRight(7),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 13),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.network(
                  partido.homeTeam.crest,
                  height: 40,
                  width: 40,
                )
              ])),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    partido.formattedDate,
                    style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500 ),
                  ),
                  Text(
                    partido.status,
                    style: const TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.w500),
                  )
                ]
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Row(
                children: [
                  Image.network(
                    partido.awayTeam.crest,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    partido.awayTeam.shortName.length > 10
                        ? partido.awayTeam.shortName.substring(0, 7)
                        : partido.awayTeam.shortName.padRight(7),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomTorneo extends StatelessWidget {
  final Torneo torneo;
  const CustomTorneo({
    super.key,
    required this.torneo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(height: 50, width: 50, torneo.logoTorneo!),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  torneo.nombre!,
                  style: const TextStyle(color: Colors.black),
                ),
                const Spacer(),
                const Text(
                  'See all',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            ...torneo.partidos!.map((partido) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  CustomPartido(
                    partido: partido,
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}

class CustomPartido extends StatelessWidget {
  final Partido partido;
  const CustomPartido({
    super.key,
    required this.partido,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                    height: 40, width: 40, partido.imagenEquipoLocal!),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  partido.equipoLocal!,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Image.network(
                    height: 40, width: 40, partido.imagenEquipoVisitante!),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  partido.equipoVisitante!,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              partido.resultadoLocal!,
              style: const TextStyle(color: Colors.black),
            ),
            const Text(
              '',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              partido.resultadoVisitante!,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              partido.fecha!,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              partido.hora!,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              partido.marcadorGlobal!,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        )
      ],
    );
  }
}

class CustomBottom extends StatelessWidget {
  final String descrip;
  const CustomBottom({
    super.key,
    required this.descrip,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          // Acción del primer botón
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.blue), // Borde azul
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Bordes redondeados
          ),
        ),
        child: Text(
          descrip,
          style: const TextStyle(color: Colors.blue, fontSize: 11),
        ),
      ),
    );
  }
}

class CustomCardInfo extends StatelessWidget {
  const CustomCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Expanded(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27, vertical: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Liverpool reaches CL quarterfinals despite loss to Inter',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text('7h',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500))
        ]),
      )),
    );
  }
}

class CustromCardPartido extends StatelessWidget {
  const CustromCardPartido({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.yellow], // De rojo a amarillo
                  begin: Alignment
                      .centerLeft, // Inicio del degradado a la izquierda
                  end: Alignment.centerRight, // Fin del degradado a la derecha
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      'LIVERPOOL',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      'DORTMUND',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'UEFA CHAMPIONS LEAGUE',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                        height: 50,
                        width: 50,
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNrltzwSHFaxefWkwzZLJz8x8mhDo3Sdt4cA&s'),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text('1',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.only(bottom: 15, top: 5),
                    child: Column(children: [
                      Text(
                        'FT',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'AGG 2-1',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      )
                    ])),
                Row(
                  children: [
                    const Text('0',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.network(
                        height: 50,
                        width: 50,
                        'https://i.ebayimg.com/images/g/rV8AAOSw2ApkLpIH/s-l1200.jpg'),
                  ],
                )
              ],
            )
          ],
        ));
  }
}

class CardInicio extends StatelessWidget {
  const CardInicio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack para superponer elementos
          Stack(
            alignment: Alignment.center, // Centrar el icono en la imagen
            children: [
              const FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/loaders/bottle-loader.gif'),
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQJ2sZUUc6xap9g__-HYUVi9LA2MnfG8_7xF33YejfCkudFpb2voAVKP3K2kg9RBHVo4gFx5saiDaNNzxhhMLjPg',
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(
                  Icons.play_arrow, // Ícono de "play"
                  color: Colors.grey[600],
                  size: 50, // Tamaño del icono
                ),
              ),
            ],
          ),
          const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FadeInImage(
              height: 60,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/loaders/bottle-loader.gif'),
              image: NetworkImage(
                'https://static.vecteezy.com/system/resources/previews/015/863/606/non_2x/brighton-and-hove-albion-logo-on-transparent-background-free-vector.jpg',
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 5),
                child: Text(
                  "Brighton & Hoven reach UCL quarters despite lackluster performance",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
//https://e7.pngegg.com/pngimages/919/941/png-clipart-brighton-hove-albion-f-c-falmer-stadium-logo-west-ham-united-f-c-brand-wimbledon-text-team.png