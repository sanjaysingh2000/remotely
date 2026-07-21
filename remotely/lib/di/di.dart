import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:remotely/core/network/dio_client.dart';
import 'package:remotely/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:remotely/features/bookmarkedJobs/data/bookmarkRepoImpl.dart';
import 'package:remotely/features/bookmarkedJobs/data/bookmark_local_dc/bookmark_local_dc.dart';
import 'package:remotely/features/bookmarkedJobs/domain/bookmark_repo.dart';
import 'package:remotely/features/bookmarkedJobs/domain/usecases/bookmark_usecases.dart';
import 'package:remotely/features/bookmarkedJobs/presenatation/bloc/bloc/bookmark_bloc.dart';
import 'package:remotely/features/home/data/local_remote_job_datasource/local_remote_job_datasource.dart';
import 'package:remotely/features/home/data/remote_data_source.dart/remote_job_data_source.dart';
import 'package:remotely/features/home/data/remote_job_impl.dart';
import 'package:remotely/features/home/domain/remote_job_repo.dart';
import 'package:remotely/features/home/domain/usecases/auth_use_cases.dart';
import 'package:remotely/features/home/presentation/bloc/job_bloc.dart';

final GetIt getIt = GetIt.instance;


void configureDependencies() {
 getIt.registerLazySingleton<Dio>(() => DioClient.create());  // getIt.registerSingleton<YourService>(YourServiceImplementation());

  //auth
  // getIt.registerFactory(() => Auth(jobUseCase: getIt<JobUseCases>()));}


  //job
  getIt.registerLazySingleton<RemoteJobDataSource>(
  () => RemoteJobDataSource(getIt<Dio>()),
);

  getIt.registerLazySingleton<JobLocalDataSource>(() => JobLocalDataSource());
  getIt.registerLazySingleton<RemoteJobRepository>(() => RemoteJobImpl(remoteJobDataSource: getIt<RemoteJobDataSource>(),
  bookmarkLocalDc: getIt<BookmarkLocalDc>(),
  localDataSource: getIt<JobLocalDataSource>()
  ));


  getIt.registerLazySingleton<JobUseCases>(() => JobUseCases(remoteJobRepository: getIt<RemoteJobRepository>()
  ));

getIt.registerFactory(() => JobBloc(jobUseCase: getIt<JobUseCases>()));


///bookmark
getIt.registerLazySingleton<BookmarkLocalDc>(() =>BookmarkLocalDc() ,);

getIt.registerLazySingleton<BookmarkRepo>(() => Bookmarkrepoimpl(getIt<BookmarkLocalDc>()));


getIt.registerLazySingleton<BookmarkUsecases>(() =>BookmarkUsecases(bookmarkRepo: getIt()) ,);

getIt.registerFactory(() => BookmarkBloc(getIt()));


}


