import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_interview_task/data/providers/services/rest_client_provider.dart';

import '../../../services/movies_service.dart';

final moviesServiceProvider = Provider<MoviesService>((ref) {
  final restClient = ref.watch(restClientProvider);
  return MoviesService(restClient);
});
