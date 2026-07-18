import 'package:remotely/features/home/data/models/jobs_response.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';

abstract class RemoteJobRepository {
  Future<List<JobEntity>> getRemoteJobs();
}