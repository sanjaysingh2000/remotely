import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remotely/core/shimmers/job_listing_shimmers.dart';
import 'package:remotely/core/theme/app_theme.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';
import 'package:remotely/features/home/presentation/bloc/event/job_event.dart';
import 'package:remotely/features/home/presentation/bloc/job_bloc.dart';
import 'package:remotely/features/home/presentation/bloc/state/job_state.dart';

class JobListing extends StatelessWidget {
  const JobListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remote Job', style: AppTextStyles.heading,),
      ),
      body: SafeArea(
        child: Column(
          
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<JobBloc, JobState>(
              builder: (BuildContext context,  state) {
                return state.whenOrNull(
                  initial: () {},
                  loading: () => Expanded(
                    child: ListView.builder(itemBuilder: (context, index) => LoadingJobListPage(),
                    itemCount: 10,),
                  ),
                  success: (jobs) {
                   return Expanded(
                     child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(height: 10),
                        itemCount: jobs.length,
                        itemBuilder: (context, index) {
                          final job = jobs[index];
                          return JobCard(job);
                        },),
                   );
                  },
                  error: (message) => Text('Error: $message'),
                ) ?? SizedBox.shrink();
              },
           
            ),
          ],
        ),
      ),
    );
  }

  Card JobCard(JobEntity job) {
    return Card(
      elevation: 4,
      child: Column(
         children: [
          CachedNetworkImage(
  imageUrl: job.companyLogo,
  httpHeaders: const {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120.0.0.0 Safari/537.36',
  },
  placeholder: (context, url) => const CircularProgressIndicator(),
  errorWidget: (context, url, error) => const Icon(Icons.business, size: 50,),
),
          Text(job.title, style: AppTextStyles.subHeading,),
          Text(job.companyName, style: AppTextStyles.body,),
          Text(job.location, style: AppTextStyles.body,),
          Text(job.jobType, style: AppTextStyles.body,),
          Text(job.salary, style: AppTextStyles.body,),
         ],
      ),
    );
  }

}