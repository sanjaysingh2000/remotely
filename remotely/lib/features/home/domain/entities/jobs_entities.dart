class JobEntity {
  final int id;
  final String title;
  final String companyName;
  final String companyLogo;
  final String location;
  final String jobType;
  final List<String> tags;
  final String salary;
  final String description;
  final bool? isBookMarked;

  JobEntity({
    required this.id,
    required this.title,
    required this.companyName,
    required this.companyLogo,
    required this.location,
    required this.jobType,
    required this.tags,
    required this.salary,
    required this.description,
    this.isBookMarked = false,
  });

  JobEntity copyWith({
    int? id,
    String? title,
    String? companyName,
    String? companyLogo,
    String? location,
    String? jobType,
    List<String>? tags,
    String? salary,
    String? description,
    bool? isBookMarked,
  }) {
    return JobEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      companyName: companyName ?? this.companyName,
      companyLogo: companyLogo ?? this.companyLogo,
      location: location ?? this.location,
      jobType: jobType ?? this.jobType,
      tags: tags ?? this.tags,
      salary: salary ?? this.salary,
      description: description ?? this.description,
      isBookMarked: isBookMarked ?? this.isBookMarked,
    );
  }

  @override
  String toString() {
    return 'JobEntity(id: $id, title: $title, companyName: $companyName, companyLogo: $companyLogo, location: $location, jobType: $jobType, tags: $tags, salary: $salary, description: $description, isBookMarked: $isBookMarked)';
  }
}

class JobsResponseEntity {
  final int jobCount;
  final int totalJobCount;
  final List<JobEntity> jobs;

  JobsResponseEntity({
    required this.jobCount,
    required this.totalJobCount,
    required this.jobs,
  });

  @override
  String toString() {
    return 'JobsResponseEntity(jobCount: $jobCount, totalJobCount: $totalJobCount, jobs: $jobs)';
  }
}