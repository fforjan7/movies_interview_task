import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_interview_task/data/providers/hive/favorite_movies_box_provider.dart';
import 'package:movies_interview_task/data/providers/hive/genres_box_provider.dart';
import 'package:movies_interview_task/data/providers/hive/movies_box_provider.dart';
import 'package:movies_interview_task/services/data/movies_data_source.dart';

final moviesDataSourceProvider = FutureProvider<MoviesDataSource>((ref) async {
  final genresBox = await ref.watch(genresBoxProvider.future);
  final moviesBox = await ref.watch(moviesBoxProvider.future);
  final favoriteMoviesBox = await ref.watch(favoriteMoviesBoxProvider.future);

  return MoviesDataSource(
    genresBox,
    moviesBox,
    favoriteMoviesBox,
  );
});
