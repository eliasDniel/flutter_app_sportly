import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.search, color: Colors.white),
        title: const Text(
          'SPORTLY',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [Icon(Icons.settings, color: Colors.white)],
      ),
      body: ListView(
        children: [
          const CardInicio(),
          Card(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.red,
                          Colors.yellow
                        ], // De rojo a amarillo
                        begin: Alignment
                            .centerLeft, // Inicio del degradado a la izquierda
                        end: Alignment
                            .centerRight, // Fin del degradado a la derecha
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            'LIVERPOOL',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text(
                            'DORTMUND',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
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
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
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
              )),
          const SizedBox(
            height: 5,
          ),
          const Center(
              child: Text(
            '2nd LEG - LIVERPOOL ADVANCE 2-1 ON AGGREGATE',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          )),
          const SizedBox(
            height: 5,
          ),
          const Card(
            child: Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 27, vertical: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Liverpool reaches CL quarterfinals despite loss to Inter',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20,),
                    Text('7h', style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500))
                  ]),
            )),
          ),
          const SizedBox(
            height: 5,
          ),

          Row(
  children: [
    Expanded(
      child: OutlinedButton(
        onPressed: () {
          // Acción del primer botón
        },
        child: Text(
          'SUMMARY',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 11
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.blue), // Borde azul
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Bordes redondeados
          ),
        ),
      ),
    ),
    SizedBox(width: 5), // Espacio entre los botones
    Expanded(
      child: OutlinedButton(
        onPressed: () {
          // Acción del segundo botón
        },
        child: Text(
          'STATISTICS',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 11
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ),
    SizedBox(width: 5), // Espacio entre los botones
    Expanded(
      child: OutlinedButton(
        onPressed: () {
          // Acción del tercer botón
        },
        child: Text(
          'COMMENTARY',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 11
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ),
  ],
)

        ],
      ),
    );
  }
}

class CardInicio extends StatelessWidget {
  const CardInicio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
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
                  borderRadius: BorderRadius.circular(100)
                ),
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