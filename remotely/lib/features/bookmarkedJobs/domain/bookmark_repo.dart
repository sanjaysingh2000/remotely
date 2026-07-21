import 'package:remotely/features/home/data/models/jobs_response.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';

abstract class BookmarkRepo {
  Future<List<JobEntity>> getBookmarkedJobs();
}