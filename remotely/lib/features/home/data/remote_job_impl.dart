import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:remotely/features/bookmarkedJobs/data/bookmark_local_dc/bookmark_local_dc.dart';
import 'package:remotely/features/home/data/local_remote_job_datasource/local_remote_job_datasource.dart';
import 'package:remotely/features/home/data/mapper/job_mapper.dart';
import 'package:remotely/features/home/data/models/jobs_response.dart';
import 'package:remotely/features/home/data/remote_data_source.dart/remote_job_data_source.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';
import 'package:remotely/features/home/domain/remote_job_repo.dart';

class RemoteJobImpl extends RemoteJobRepository {

final RemoteJobDataSource remoteJobDataSource;

final JobLocalDataSource _localDataSource;

final BookmarkLocalDc _bookmarkLocalDc;

RemoteJobImpl({required this.remoteJobDataSource,required this._localDataSource, required this._bookmarkLocalDc});


  @override
  Future<List<JobEntity>> getRemoteJobs() async {
    try{
    final response = await remoteJobDataSource.getRemoteJobs();

    final remoteJobs = response.data.jobs.map((job) => job.toEntity()).toList();
    final localBookmarks = await _bookmarkLocalDc.getBookmarkedJobs();

final Set<int> bookmarkedIds = localBookmarks.map((job) => job.id).toSet();

final List<JobEntity> updatedJobs = remoteJobs.map((job) {
  final bool isBookmarked = bookmarkedIds.contains(job.id);
    return job.copyWith(isBookMarked: isBookmarked);
  
 }).toList();

      await _localDataSource.clearJobs();
      await _localDataSource.cacheJobs(response.data.jobs);
          return updatedJobs;
    }on DioException catch(e){
      final isConnectivityIssue = e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout;

    if (isConnectivityIssue) {
      final cached = await _localDataSource.getCachedJobs();
      if (cached.isNotEmpty) {
        return cached.map((job) => job.toEntity()).toList();
      }
    }
    rethrow; 
    }    
    catch(e){
      rethrow;
    }   
  }
  
  
 @override
Future<bool> bookMarkJobs(JobEntity job) async {
  final jobModel = job.toJob();
  return _localDataSource.cacheBookMarkJobs(jobModel);
}
  

}