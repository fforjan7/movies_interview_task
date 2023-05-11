import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:movies_interview_task/data/providers/movies_notifier.dart';

import '../../../data/models/persistence/db_movie.dart';

class MoviesPage extends ConsumerWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.watch(moviesProvider);
    //print('Screen 2');
    //print(ref.read(genresProvider));
    return ValueListenableBuilder<Box<DbMovie>>(
      valueListenable: provider.moviesListenable,
      builder: (context, box, _) {
        final movies = box.values.map((e) => e.asDomain()).toList();
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              title: Text(movie.title),
              // Customize the ListTile as per your requirement
            );
          },
        );
      },
    );
  }
}
