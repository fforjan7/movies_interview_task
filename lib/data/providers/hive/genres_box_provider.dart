import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:movies_interview_task/data/models/persistence/db_genre.dart';

final genresBoxProvider = FutureProvider<Box<DbGenre>>((ref) async {
  var box = await Hive.openBox<DbGenre>('genres');
  return box;
});
