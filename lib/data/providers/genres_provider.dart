import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_interview_task/data/models/domain/genre.dart';

final genresProvider = StateProvider<List<Genre>>((ref) {
  return [];
});
