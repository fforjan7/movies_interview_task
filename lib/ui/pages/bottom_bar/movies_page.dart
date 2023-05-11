import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:movies_interview_task/common/enums/state_enum.dart';
import 'package:movies_interview_task/data/providers/movies_notifier.dart';

import '../../../data/models/persistence/db_movie.dart';
import '../../../data/providers/connectivity_provider.dart';

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
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      await ref.read(moviesProvider.notifier).fetchAndSaveMoviesPageToDb();
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(moviesProvider);
    var connectivity = ref.watch(connectivityProvider);
    var isLoading = provider.appState == AppState.loading;

    return ValueListenableBuilder<Box<DbMovie>>(
      valueListenable: provider.moviesListenable,
      builder: (context, box, _) {
        final movies = box.values.map((movie) => movie.asDomain()).toList();
        return ListView.builder(
          controller: _scrollController,
          itemCount: movies.length + (isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == movies.length) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final movie = movies[index];
            return ListTile(
              title: Text(movie.title),
              leading: Text("$index"),
            );
          },
        );
      },
    );
  }
}
