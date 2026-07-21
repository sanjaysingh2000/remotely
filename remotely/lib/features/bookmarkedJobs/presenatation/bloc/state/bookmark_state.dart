

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';


part 'bookmark_state.freezed.dart';

@freezed
class BookMarkState with _$BookMarkState {
  factory BookMarkState.bookmarkedJobs(List<JobEntity> jobs) = _BookMarkedJobs;


  factory BookMarkState.intial() = _Intial;

  
}