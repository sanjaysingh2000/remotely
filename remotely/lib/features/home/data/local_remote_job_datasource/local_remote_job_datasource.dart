import 'package:remotely/core/local_storage/db_helper/db_helper.dart';
import 'package:remotely/features/home/data/models/jobs_response.dart';
import 'package:sqflite/sqflite.dart';

class JobLocalDataSource {
  final dbHelper = DbHelper.getInstance();

  Future<void> cacheJobs(List<Job> jobs) async {
    final db = await dbHelper.getDb();
    final batch = db.batch();   // ✅ multiple inserts ek saath — fast

    for (final job in jobs) {
      batch.insert(
        tableName,
        {
          'title': job.title,
          'companyName': job.companyName,
          'location': job.candidateRequiredLocation,
          'jobType': job.jobType,
          'salary': job.salary,
          // 'tags': job.tags.join(','),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,  // duplicate id pe overwrite
      );
    }
    final results = await batch.commit(noResult: false);  // ✅ noResult: false karo
    print('Inserted ${results.length} rows successfully');  
  }

  // 2. Read karna (offline ke liye)
Future<List<Job>> getCachedJobs() async {
  final Database db = await dbHelper.getDb();          // ✅ explicit type
  final List<Map<String, Object?>> maps = await db.query(tableName);  // ✅ explicit type

  final List<Job> jobs = maps.map((map) => Job(
    id: map['id'] as int,
    title: map['title'] as String,
    companyName: map['companyName'] as String,
    companyLogo: (map['companyLogo'] as String?) ?? '',
    candidateRequiredLocation: map['location'] as String,
    jobType: map['jobType'] as String,
    salary: map['salary'] as String,
    tags: (map['tags'] as String?)?.split(',') ?? [],
    url: '', category: '', publicationDate: '', description: '',
  )).toList();

  return jobs;
}

  // 3. Purana data clear karna (naya fetch aane pe, warna duplicates jama honge)
  Future<void> clearJobs() async {
    final db = await dbHelper.getDb();
    await db.delete(tableName);
  }
}