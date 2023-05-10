import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:movies_interview_task/data/models/persistence/db_movie.dart';

final moviesBoxProvider = FutureProvider<Box<DbMovie>>((ref) async {
  var box = await Hive.openBox<DbMovie>('movies');
  return box;
});
