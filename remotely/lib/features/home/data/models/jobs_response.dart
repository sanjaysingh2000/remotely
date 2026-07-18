import 'package:json_annotation/json_annotation.dart';

part 'jobs_response.g.dart';

@JsonSerializable()
class JobsResponse {
  @JsonKey(name: 'job-count')
  final int jobCount;

  @JsonKey(name: 'total-job-count')
  final int totalJobCount;

  final List<Job> jobs;

  JobsResponse({
    required this.jobCount,
    required this.totalJobCount,
    required this.jobs,
  });

  factory JobsResponse.fromJson(Map<String, dynamic> json) =>
      _$JobsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JobsResponseToJson(this);
}


@JsonSerializable()
class Job {
  final int id;
  final String? url;
  final String? title;

  @JsonKey(name: 'company_name')
  final String? companyName;

  @JsonKey(name: 'company_logo')
  final String? companyLogo;

  final String? category;
  final List<String>? tags;

  @JsonKey(name: 'job_type')
  final String? jobType;

  @JsonKey(name: 'publication_date')
  final String? publicationDate;

  @JsonKey(name: 'candidate_required_location')
  final String? candidateRequiredLocation;

  final String? salary;
  final String? description;

  Job({
    required this.id,
     this.url,
     this.title,
     this.companyName,
     this.companyLogo,
     this.category,
     this.tags,
     this.jobType,
     this.publicationDate,
     this.candidateRequiredLocation,
     this.salary,
     this.description,
  });

  factory Job.fromJson(Map<String, dynamic> json) =>
      _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);
}


