import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_interview_task/data/providers/movies_notifier.dart';
import 'package:movies_interview_task/ui/widgets/movie_widgets/movie_details/movie_details_custom_app_bar.dart';

import '../../../data/models/domain/movie.dart';
import '../../widgets/movie_widgets/movie_details/movie_details_body.dart';

class MovieDetailsPage extends ConsumerStatefulWidget {
  const MovieDetailsPage({super.key, required this.movie});

  final Movie movie;

  @override
  ConsumerState<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends ConsumerState<MovieDetailsPage> {
  late bool isFavorite;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavorite = widget.movie.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: Movie.getFullImagePath(widget.movie.backdropPath),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Column(
              children: [
                MovieDetailsCustomAppBar(
                  isFavorite: isFavorite,
                  onTap: () {
                    ref
                        .read(moviesProvider.notifier)
                        .changeIsFavorite(widget.movie.id);
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
                Expanded(
                  child: MovieDetailsBody(movie: widget.movie),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
