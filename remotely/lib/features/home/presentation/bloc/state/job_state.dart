import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';


part 'job_state.freezed.dart';

@freezed
class JobState with _$JobState {
  const factory JobState.initial() = _Initial;
  const factory JobState.loading() = _Loading;
  const factory JobState.success(List<JobEntity> jobs) = _Success;
  const factory JobState.error(String message) = _Error;

  const factory JobState.cachedJobs(List<JobEntity> jobs, String message) = _CachedJobs;

  const factory JobState.bookmarkJobSuccess() = _bookmarkJobSuccess;
    const factory JobState.bookmarkJobFailure() = _bookmarkJobFailure;


}
