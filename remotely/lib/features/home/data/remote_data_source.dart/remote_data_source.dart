import 'package:dio/dio.dart';
import 'package:remotely/features/home/data/models/jobs_response.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_data_source.g.dart';


@RestApi()
abstract class RemoteJobDataSource {
  factory RemoteJobDataSource(Dio dio, {String baseUrl}) = _RemoteJobDataSource;

  @GET("remote-jobs")
  Future<HttpResponse<JobsResponse>> getRemoteJobs(); 
}
