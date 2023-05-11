import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_interview_task/data/providers/genres_provider.dart';
import 'package:movies_interview_task/data/providers/repositories/movies_repository_provider.dart';

final initialProvider = FutureProvider<void>((ref) async {
  try {
    final movieRepo = ref.watch(moviesRepositoryProvider);
    movieRepo.whenData((repo) async {
      await repo.saveGenresToDb();
      var dbGenres = repo.getGenresFromDb();
      var genres = dbGenres.map((dbGenre) => dbGenre.asDomain()).toList();
      ref.read(genresProvider.notifier).state = genres;
    });
  } catch (e) {
    print(e);
  }
});
