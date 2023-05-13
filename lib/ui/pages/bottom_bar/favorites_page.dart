import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:movies_interview_task/data/providers/favorite_movies_notifier.dart';

import '../../../common/constants/routes.dart';
import '../../../common/resources/text_styles.dart';
import '../../../data/models/persistence/db_movie.dart';
import '../../widgets/movie_widgets/reusable_movie_tile.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(favoriteMoviesProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0, bottom: 20.0),
            child: Text(
              "Favorites",
              style: AppTextStyles.playfair24BlackTextW700,
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<Box<DbMovie>>(
              valueListenable: provider.favoriteMoviesListenable,
              builder: (context, box, _) {
                final movies =
                    box.values.map((movie) => movie.asDomain()).toList();
                return movies.isEmpty
                    ? const Center(child: Text("Favorite movies list is empty"))
                    : ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          if (index == movies.length) {
                            return const Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Center(child: CircularProgressIndicator()),
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
                                      .read(favoriteMoviesProvider.notifier)
                                      .changeIsFavorite(movie.id);
                                },
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
