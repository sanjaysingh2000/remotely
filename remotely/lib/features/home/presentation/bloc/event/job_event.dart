import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';

part 'job_event.freezed.dart';

@freezed
class JobEvent with _$JobEvent {
  const factory JobEvent.fetchJobs() = _FetchJobs;
  const factory JobEvent.bookMarkJobs(JobEntity job) = _BookMarkJob;
  const factory JobEvent.searchJob(String query) = _SearchJob; 
}
  