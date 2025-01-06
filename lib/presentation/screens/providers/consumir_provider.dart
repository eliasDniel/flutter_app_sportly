
import 'package:flutter_app_sportly/presentation/screens/providers/torneo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Proveedor de tipo ChangeNotifier
final providerTorneo = ChangeNotifierProvider<TorneoProvider>((ref) {
  return TorneoProvider();
});
