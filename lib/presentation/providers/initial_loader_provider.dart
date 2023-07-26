import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_app/presentation/providers/characters_provider.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  Future.delayed(const Duration(seconds: 2));
  return ref.watch(charactersRickMortyProvider).isEmpty;
});