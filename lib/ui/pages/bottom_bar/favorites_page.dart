import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:movies_interview_task/data/providers/favorite_movies_notifier.dart';

import '../../../data/models/persistence/db_movie.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(favoriteMoviesProvider);
    return Column(
      children: [
        const Text("FAVORIT"),
        Expanded(
          child: ValueListenableBuilder<Box<DbMovie>>(
            valueListenable: provider.favoriteMoviesListenable,
            builder: (context, box, _) {
              final movies =
                  box.values.map((movie) => movie.asDomain()).toList();
              return ListView.builder(
                itemCount: movies.length,
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
                      ref
                          .read(favoriteMoviesProvider.notifier)
                          .changeIsFavorite(movie.id);
                    },
                    title: Text(movie.title),
                    leading: Text("$index"),
                    subtitle: movie.isFavorite
                        ? const Text("Da",
                            style: TextStyle(color: Colors.green))
                        : const Text("Ne", style: TextStyle(color: Colors.red)),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
