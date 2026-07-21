// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobsResponse _$JobsResponseFromJson(Map<String, dynamic> json) => JobsResponse(
  jobCount: (json['job-count'] as num).toInt(),
  totalJobCount: (json['total-job-count'] as num).toInt(),
  jobs: (json['jobs'] as List<dynamic>)
      .map((e) => Job.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$JobsResponseToJson(JobsResponse instance) =>
    <String, dynamic>{
      'job-count': instance.jobCount,
      'total-job-count': instance.totalJobCount,
      'jobs': instance.jobs,
    };

Job _$JobFromJson(Map<String, dynamic> json) => Job(
  id: (json['id'] as num).toInt(),
  url: json['url'] as String?,
  title: json['title'] as String?,
  companyName: json['company_name'] as String?,
  companyLogo: json['company_logo'] as String?,
  category: json['category'] as String?,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  jobType: json['job_type'] as String?,
  publicationDate: json['publication_date'] as String?,
  candidateRequiredLocation: json['candidate_required_location'] as String?,
  salary: json['salary'] as String?,
  description: json['description'] as String?,
  isBookMarked: json['isBookMarked'] as bool? ?? false,
);

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'title': instance.title,
  'company_name': instance.companyName,
  'company_logo': instance.companyLogo,
  'category': instance.category,
  'tags': instance.tags,
  'job_type': instance.jobType,
  'publication_date': instance.publicationDate,
  'candidate_required_location': instance.candidateRequiredLocation,
  'salary': instance.salary,
  'description': instance.description,
  'isBookMarked': instance.isBookMarked,
};
