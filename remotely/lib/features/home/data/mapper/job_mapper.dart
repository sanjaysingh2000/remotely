import 'package:remotely/features/home/domain/entities/jobs_entities.dart';

import '../models/jobs_response.dart';

extension JobMapper on Job {
  JobEntity toEntity() {
    return JobEntity(
      id: id,
      title: title ??'',
      companyName: companyName ??'',
      companyLogo: companyLogo ?? '',
      location: candidateRequiredLocation ?? '',
      jobType: jobType ?? '',
      tags: tags ?? [],
      salary: salary??'',
      description: description??''
      
    );
  }
}

extension JobsResponseMapper on JobsResponse {
  List<JobEntity> toEntityList() {
    return jobs.map((e) => e.toEntity()).toList();
  }
}

extension JobEntityMapper on JobEntity {
  Job toJob() {
    return Job(
      id: id,
      title: title,
      companyName: companyName,
      companyLogo: companyLogo,
      candidateRequiredLocation: location,
      jobType: jobType,
      tags: tags,
      salary: salary,
      description: description,
      url: '',
      category: '',
      publicationDate: '',
    );
  }
}