import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'torneo_provider.dart';

// Proveedor de tipo ChangeNotifier
final providerTorneo = ChangeNotifierProvider<TorneoProvider>((ref) {
  return TorneoProvider();
});
