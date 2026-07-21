import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remotely/features/home/domain/usecases/auth_use_cases.dart';
import 'package:remotely/features/home/presentation/bloc/event/job_event.dart';
import 'package:remotely/features/home/presentation/bloc/state/job_state.dart';


class JobBloc extends Bloc<JobEvent, JobState> {
  final JobUseCases jobUseCase;

  JobBloc({required this.jobUseCase}) : super(JobState.initial()) {
    on<JobEvent>((event, emit) async{
       await event.map(
        bookMarkJobs: (event) => _bookMarkJob(event, emit),
        fetchJobs: (event) =>  _fetchJobs(emit),
      );
    });
  }

  Future<void> _fetchJobs(Emitter<JobState> emit) async {
    try {
      emit(JobState.loading());
      final jobs = await jobUseCase.getRemoteJobs();
      if (emit.isDone) return;
      emit(JobState.success(jobs));
    }
    catch (e) {
      if (emit.isDone) return;
      emit(JobState.error('Something went wrong!'));
    }
  }

Future<void> _bookMarkJob( event, Emitter<JobState> emit) async {
  try {
    final wasAdded = await jobUseCase.bookMarkJob(event.job);

    final currentJobs = state.mapOrNull(success: (s) => s.jobs);
    if (currentJobs != null) {
      final updatedJobs = currentJobs.map((job) {
        if (job.id == event.job.id) {
          return job.copyWith(isBookMarked: wasAdded);
        }
        return job;
      }).toList();

      emit(JobState.success(updatedJobs));
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}


}
 