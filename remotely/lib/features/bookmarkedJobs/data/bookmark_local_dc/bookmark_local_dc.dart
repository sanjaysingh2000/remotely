import 'package:remotely/core/local_storage/db_helper/db_helper.dart';
import 'package:remotely/features/home/data/models/jobs_response.dart';

class BookmarkLocalDc {
  final dbHelper = DbHelper.getInstance();


  // Bookmark Screen के लिए खास method
Future<List<Job>> getBookmarkedJobs() async {
  final db = await dbHelper.getDb();
  final List<Map<String, Object?>> maps = await db.query(bookMarkTable);
  
  return maps.map((map) => Job(
    description: map['description'] as String,
    id: map['id'] as int,
    title: map['title'] as String,
    companyName: map['companyName'] as String,
    companyLogo: (map['companyLogo'] as String?) ?? '',
    candidateRequiredLocation: map['location'] as String,
    jobType: map['jobType'] as String,
    salary: map['salary'] as String,
    tags: (map['tags'] as String?)?.split(',') ?? [],
    isBookMarked: true, // क्योंकि यह bookMarkTable से आ रहा है, तो हमेशा true
  )).toList();
}
}