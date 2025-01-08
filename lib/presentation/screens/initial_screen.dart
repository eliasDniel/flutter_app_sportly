import 'package:flutter/material.dart';
import 'package:flutter_app_sportly/insfrastructure/models/competition.dart';
import 'package:flutter_app_sportly/presentation/screens/providers/consumir_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class InitialScreen extends ConsumerStatefulWidget {
  static const String name = 'initial-screen';
  const InitialScreen({super.key});

  @override
  ConsumerState<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends ConsumerState<InitialScreen> {
  int? selectedIndex; // Índice de la competición seleccionada

  @override
  void initState() {
    ref.read(providerTorneo).obtenerCompetitions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final torneoProvider = ref.watch(providerTorneo);

    if (torneoProvider.isloading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.search, color: Colors.white),
        title: const Text(
          'SPORTLY',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [Icon(Icons.settings, color: Colors.white)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Número de columnas
            crossAxisSpacing: 9.0, // Espaciado horizontal
            mainAxisSpacing: 9.0, // Espaciado vertical
          ),
          itemCount: torneoProvider.listaCompeticiones.length,
          itemBuilder: (context, index) {
            final competition = torneoProvider.listaCompeticiones[index];
            final isSelected =
                selectedIndex == index; // Verificar si está seleccionada
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index; // Actualizar índice seleccionado
                });
                context.push('/initial/home/${competition.code}/0');
              },
              child: CustomCompetition(
                competition: competition,
                isSelected: isSelected, // Pasar estado seleccionado
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomCompetition extends StatelessWidget {
  const CustomCompetition({
    super.key,
    required this.competition,
    required this.isSelected,
  });

  final CompetitionElement competition;
  final bool isSelected; // Indica si está seleccionada

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[50] : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: isSelected
              ? Colors.blue
              : Colors.black38, // Bordes azules si está seleccionada
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            competition.emblem.endsWith('.svg')
                ? SvgPicture.network(
                    competition.emblem,
                    placeholderBuilder: (context) =>
                        const CircularProgressIndicator(),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    competition.emblem,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error, color: Colors.red);
                    },
                  ),
            const SizedBox(height: 5),
            Text(
              competition.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
