import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'customs/custom_card_competition.dart';
import 'providers/consumir_provider.dart';

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


