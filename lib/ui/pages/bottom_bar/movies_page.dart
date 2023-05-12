import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:movies_interview_task/common/constants/routes.dart';
import 'package:movies_interview_task/common/enums/state_enum.dart';
import 'package:movies_interview_task/data/providers/connectivity_provider.dart';
import 'package:movies_interview_task/data/providers/movies_notifier.dart';
import 'package:movies_interview_task/utils/show_internet_connection_dialog.dart';

import '../../../data/models/persistence/db_movie.dart';

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

    return Column(
      children: [
        const Text("POPULJAR"),
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
                    ? const Center(child: Text("Popular movies list is empty"))
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount: movies.length +
                            (provider.appState == AppState.loading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == movies.length) {
                            return const Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          final movie = movies[index];
                          return ListTile(
                            onTap: () {
                              context.push(AppRoutes.details,
                                  extra: {'movie': movie});
                            },
                            title: Text(movie.title),
                            leading: GestureDetector(
                              onTap: () {
                                ref
                                    .read(moviesProvider.notifier)
                                    .changeIsFavorite(movie.id);
                              },
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  color: Colors.red,
                                  child: Center(child: Text("$index"))),
                            ),
                            subtitle: movie.isFavorite
                                ? const Text("Da",
                                    style: TextStyle(color: Colors.green))
                                : const Text("Ne",
                                    style: TextStyle(color: Colors.red)),
                          );
                        },
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}
