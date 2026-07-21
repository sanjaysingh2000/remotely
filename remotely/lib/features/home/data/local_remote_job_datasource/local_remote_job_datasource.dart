import 'package:flutter/foundation.dart';
import 'package:remotely/core/local_storage/db_helper/db_helper.dart';
import 'package:remotely/features/home/data/models/jobs_response.dart';
import 'package:sqflite/sqflite.dart';

class JobLocalDataSource {
  final dbHelper = DbHelper.getInstance();

Future<bool> cacheBookMarkJobs(Job job) async {
  try {
    final db = await dbHelper.getDb();

    // check karo bookMarkTable mein already exist karta hai kya
    final existing = await db.query(
      bookMarkTable,
      where: 'id = ?',
      whereArgs: [job.id],
    );

    if (existing.isNotEmpty) {
      // already bookmarked -> remove karo dono jagah se
      await db.delete(
        bookMarkTable,
        where: 'id = ?',
        whereArgs: [job.id],
      );

      await db.update(
        jobsTable,
        {'isBookMarked': 0},
        where: 'id = ?',
        whereArgs: [job.id],
      );

      return false; // ab bookmarked nahi hai
    } else {
      // nahi exist karta -> add karo dono jagah
      await db.insert(
        bookMarkTable,
        {
          'id': job.id,
          'title': job.title,
          'companyName': job.companyName,
          'location': job.candidateRequiredLocation,
          'jobType': job.jobType,
          'salary': job.salary,
          'description': job.description,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      await db.update(
        jobsTable,
        {'isBookMarked': 1},
        where: 'id = ?',
        whereArgs: [job.id],
      );

      return true; // ab bookmarked hai
    }
  } catch (e) {
    debugPrint('Error toggling bookmark: $e');
    return false;
  }
}





Future<List<Job>> getCachedJobs() async {
  final Database db = await dbHelper.getDb();          
  final List<Map<String, Object?>> maps = await db.query(jobsTable);  

  final List<Job> jobs = maps.map((map) => Job(
    id: map['id'] as int,
    title: map['title'] as String,
    companyName: map['companyName'] as String,
    companyLogo: (map['companyLogo'] as String?) ?? '',
    candidateRequiredLocation: map['location'] as String,
    jobType: map['jobType'] as String,
    salary: map['salary'] as String,
    tags: (map['tags'] as String?)?.split(',') ?? [],
    isBookMarked: (map['isBookMarked'] as int) == 1,
    url: '', category: '', publicationDate: '', description: map['description'] as String ,
  )).toList();

  return jobs;
}



 Future<void> cacheJobs(List<Job> jobs) async {
  try {
    final db = await dbHelper.getDb();
    final batch = db.batch();

    for (final job in jobs) {
      batch.insert(
        jobsTable,
        {
          'id': job.id,
          'title': job.title,
          'companyName': job.companyName,
          'location': job.candidateRequiredLocation,
          'jobType': job.jobType,
          'salary': job.salary,
          'description': job.description,
          'isBookMarked': 0
        },
        conflictAlgorithm: ConflictAlgorithm.replace, // duplicate id pe overwrite
      );
    }
    await batch.commit(noResult: false);
    print('caching done');
  } catch (e) {
    debugPrint('Error caching jobs: $e');
    // rethrow;
  }
}

  // 3. Purana data clear karna (naya fetch aane pe, warna duplicates jama honge)
  Future<void> clearJobs() async {
    final db = await dbHelper.getDb();
    await db.delete(jobsTable);
  }
}