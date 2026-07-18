import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:remotely/features/home/data/local_remote_job_datasource/local_remote_job_datasource.dart';
import 'package:remotely/features/home/data/mapper/job_mapper.dart';
import 'package:remotely/features/home/data/models/jobs_response.dart';
import 'package:remotely/features/home/data/remote_data_source.dart/remote_data_source.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';
import 'package:remotely/features/home/domain/remote_job_repo.dart';

class RemoteJobImpl extends RemoteJobRepository {


final RemoteJobDataSource remoteJobDataSource;

final JobLocalDataSource _localDataSource;


RemoteJobImpl({required this.remoteJobDataSource,required this._localDataSource});


  @override
  Future<List<JobEntity>> getRemoteJobs() async {


    try{


 final response = await remoteJobDataSource.getRemoteJobs();

    final jobs = response.data.jobs.map((job) => job.toEntity()).toList();
      await _localDataSource.clearJobs();
          await _localDataSource.cacheJobs(response.data.jobs);
          return jobs;



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
      print('connectivity issue -->> $cached');
    }
    rethrow; 
    }
    
    
    catch(e){
      rethrow;
    }

   
  }

}