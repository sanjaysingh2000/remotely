import 'package:remotely/features/bookmarkedJobs/domain/bookmark_repo.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';

class BookmarkUsecases {
  final BookmarkRepo _bookmarkRepo;


  BookmarkUsecases({required this._bookmarkRepo});
  
   Future<List<JobEntity>> getBookMarkJobs() async{
    final response = await _bookmarkRepo.getBookmarkedJobs();
    return response;
   }
}