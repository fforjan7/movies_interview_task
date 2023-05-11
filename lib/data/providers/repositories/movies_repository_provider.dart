import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_interview_task/data/providers/services/movies_data_source_provider.dart';
import 'package:movies_interview_task/data/repositories/movies_repository.dart';

import '../services/movies_service_provider.dart';

final moviesRepositoryProvider = FutureProvider<MoviesRepository>((ref) async {
  final moviesService = ref.watch(moviesServiceProvider);
  final moviesDataSource = await ref.watch(moviesDataSourceProvider.future);
  return MoviesRepository(
    moviesService,
    moviesDataSource,
  );
});
