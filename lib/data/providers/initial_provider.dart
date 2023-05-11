import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_interview_task/data/providers/genres_provider.dart';
import 'package:movies_interview_task/data/providers/repositories/movies_repository_provider.dart';

import 'connectivity_provider.dart';

final initialProvider = FutureProvider<void>((ref) async {
  try {
    final movieRepo = ref.watch(moviesRepositoryProvider);
    final connectivity = ref.watch(connectivityProvider);
    movieRepo.whenData((repo) async {
      if (connectivity != ConnectivityResult.none) {
        await repo.fetchAndSaveGenresToDb();
      }
      var genres = repo.getGenresFromDb();
      if (genres.isNotEmpty) {
        ref.read(genresProvider.notifier).state = genres;
      }
    });
  } catch (e) {
    print(e);
  }
});
