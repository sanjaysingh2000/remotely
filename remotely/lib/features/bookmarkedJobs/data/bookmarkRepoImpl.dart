import 'package:remotely/features/bookmarkedJobs/data/bookmark_local_dc/bookmark_local_dc.dart';
import 'package:remotely/features/bookmarkedJobs/domain/bookmark_repo.dart';
import 'package:remotely/features/home/data/mapper/job_mapper.dart';
import 'package:remotely/features/home/data/models/jobs_response.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';

class Bookmarkrepoimpl extends BookmarkRepo{

  final BookmarkLocalDc _bookmarkLocalDc;

  Bookmarkrepoimpl(this._bookmarkLocalDc);


  @override
  Future<List<JobEntity>> getBookmarkedJobs() async{

    final bookMarkedJobs = await _bookmarkLocalDc.getBookmarkedJobs();

     if (bookMarkedJobs.isNotEmpty) {
        return bookMarkedJobs.map((job) => job.toEntity()).toList();
      }else{
        return [];
      }


   
  }
  
}