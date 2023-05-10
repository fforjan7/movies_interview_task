import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_interview_task/data/providers/hive/favorite_movies_box_provider.dart';
import 'package:movies_interview_task/data/providers/hive/genres_box_provider.dart';
import 'package:movies_interview_task/data/providers/hive/movies_box_provider.dart';
import 'package:movies_interview_task/data/repositories/movies_repository.dart';

import '../services/movies_service_provider.dart';

final moviesRepositoryProvider = FutureProvider<MoviesRepository>((ref) async {
  final moviesService = ref.watch(moviesServiceProvider);
  final genresBox = await ref.watch(genresBoxProvider.future);
  final moviesBox = await ref.watch(moviesBoxProvider.future);
  final favoriteMoviesBox = await ref.watch(favoriteMoviesBoxProvider.future);
  return MoviesRepository(
    moviesService: moviesService,
    genresBox: genresBox,
    moviesBox: moviesBox,
    favoriteMoviesBox: favoriteMoviesBox,
  );
});
