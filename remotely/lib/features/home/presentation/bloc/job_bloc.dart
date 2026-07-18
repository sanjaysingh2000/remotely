import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remotely/features/home/data/models/jobs_response.dart';
import 'package:remotely/features/home/domain/usecases/auth_use_cases.dart';
import 'package:remotely/features/home/presentation/bloc/event/job_event.dart';
import 'package:remotely/features/home/presentation/bloc/state/job_state.dart';


class JobBloc extends Bloc<JobEvent, JobState> {
  final JobUseCases jobUseCase;

  JobBloc({required this.jobUseCase}) : super(JobState.initial()) {
    on<JobEvent>((event, emit) async {
      await event.map(
        fetchJobs: (value) => _fetchJobs(emit),
      );
    });
  }

  Future<void> _fetchJobs(Emitter<JobState> emit) async {
    try {
      emit(JobState.loading());

      final jobs = await jobUseCase.getRemoteJobs();

      if (emit.isDone) return;

      emit(JobState.success(jobs));
    }on DioException catch(e){
      final isConnectivityIssue = e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout;

    if (isConnectivityIssue) {
      // emit(JobState.cachedJobs(jobs, "ada"));
    }
    }
    catch (e) {
      if (emit.isDone) return;

      // emit(JobState.cachedJobs(jobs, "ada"));
    }
  }
}
 