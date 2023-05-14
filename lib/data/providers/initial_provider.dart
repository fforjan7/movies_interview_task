import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_interview_task/data/providers/repositories/movies_repository_provider.dart';
import 'package:movies_interview_task/utils/server_exception.dart';

import 'connectivity_provider.dart';

final initialProvider = FutureProvider<void>((ref) async {
  try {
    final movieRepo = ref.watch(moviesRepositoryProvider);
    final connectivity = ref.watch(connectivityProvider);
    movieRepo.whenData((repo) async {
      if (connectivity != ConnectivityResult.none) {
        try {
          await repo.fetchAndSaveGenresToDb();
        } catch (e) {
          if (e is ServerException) {
            // print(e.message());
          }
        }
      }
    });
  } catch (e) {
    if (e is ServerException) {
      // print(e.message());
    }
  }
});
