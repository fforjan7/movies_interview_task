import 'package:hive/hive.dart';
import 'package:movies_interview_task/common/constants/constants.dart';

import '../domain/genre.dart';

part 'db_genre.g.dart';

@HiveType(typeId: AppConstants.genreTypeAdapterId)
class DbGenre extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  String name;

  DbGenre({
    required this.id,
    required this.name,
  });

  Genre asDomain() {
    return Genre(id: id, name: name);
  }
}
