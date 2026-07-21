import 'package:remotely/features/home/domain/entities/jobs_entities.dart';
import 'package:remotely/features/home/domain/remote_job_repo.dart';

class JobUseCases {
  final RemoteJobRepository remoteJobRepository;
  JobUseCases({required this.remoteJobRepository});

  Future<List<JobEntity>> getRemoteJobs() async {
    return await remoteJobRepository.getRemoteJobs();
  }

  Future<bool> bookMarkJob(JobEntity job) async{
    return  remoteJobRepository.bookMarkJobs(job);
  }
}