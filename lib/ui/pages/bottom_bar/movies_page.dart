import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:movies_interview_task/common/enums/state_enum.dart';
import 'package:movies_interview_task/common/resources/text_styles.dart';
import 'package:movies_interview_task/data/providers/connectivity_provider.dart';
import 'package:movies_interview_task/data/providers/movies_notifier.dart';
import 'package:movies_interview_task/utils/show_internet_connection_dialog.dart';

import '../../../common/constants/routes.dart';
import '../../../data/models/persistence/db_movie.dart';
import '../../widgets/movie_tile/reusable_movie_tile.dart';

class MoviesPage extends ConsumerStatefulWidget {
  const MoviesPage({super.key});

  @override
  ConsumerState<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends ConsumerState<MoviesPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollListener() async {
    var connectivity = ref.watch(connectivityProvider);
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      await _fetchDataOrShowInternetConnectonDialog(connectivity);
    }
  }

  Future<void> _fetchDataOrShowInternetConnectonDialog(
      ConnectivityResult connectivity,
      [int? page]) async {
    if (connectivity == ConnectivityResult.none) {
      showInternetConnectionDialog(context);
    } else {
      await ref.read(moviesProvider.notifier).fetchAndSaveMoviesPageToDb(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(moviesProvider);
    var connectivity = ref.watch(connectivityProvider);
    var isLoading = provider.appState == AppState.loading;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0, bottom: 20.0),
            child: Text(
              "Popular",
              style: AppTextStyles.playfair24BlackTextW700,
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<Box<DbMovie>>(
              valueListenable: provider.moviesListenable,
              builder: (context, box, _) {
                final movies =
                    box.values.map((movie) => movie.asDomain()).toList();
                return RefreshIndicator(
                  onRefresh: () async {
                    await _fetchDataOrShowInternetConnectonDialog(
                        connectivity, 1);
                  },
                  child: movies.isEmpty
                      ? const Center(
                          child: Text("Popular movies list is empty"))
                      : ListView.builder(
                          controller: _scrollController,
                          itemCount: movies.length + (isLoading ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == movies.length) {
                              return const Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }
                            final movie = movies[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  context.push(AppRoutes.details,
                                      extra: {'movie': movie});
                                },
                                child: ReusableMovieTile(
                                  movie: movie,
                                  onTap: () {
                                    ref
                                        .read(moviesProvider.notifier)
                                        .changeIsFavorite(movie.id);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
