class JobEntity {
  final int id;
  final String title;
  final String companyName;
  final String companyLogo;
  final String location;
  final String jobType;
  final List<String> tags;
  final String salary;

  JobEntity({
    required this.id,
    required this.title,
    required this.companyName,
    required this.companyLogo,
    required this.location,
    required this.jobType,
    required this.tags, required this.salary,
  });
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
}

