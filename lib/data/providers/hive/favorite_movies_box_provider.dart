import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../models/persistence/db_movie.dart';

final favoriteMoviesBoxProvider = FutureProvider<Box<DbMovie>>((ref) async {
  var box = await Hive.openBox<DbMovie>('favorite_movies');
  return box;
});
