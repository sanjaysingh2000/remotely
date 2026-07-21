
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:remotely/core/shimmers/job_listing_shimmers.dart';
import 'package:remotely/core/theme/app_theme.dart';
import 'package:remotely/core/widgets/custom_text_field.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';
import 'package:remotely/features/home/presentation/bloc/event/job_event.dart';
import 'package:remotely/features/home/presentation/bloc/job_bloc.dart';
import 'package:remotely/features/home/presentation/bloc/state/job_state.dart';

class JobListing extends StatefulWidget {
  const JobListing({super.key});

  @override
  State<JobListing> createState() => _JobListingState();
}

class _JobListingState extends State<JobListing> {

  Timer? _debounce;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<JobBloc>().add(JobEvent.fetchJobs());
  });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Padding(
          
          padding: EdgeInsets.only(right: 18),
          child: IconButton(icon:Icon(Icons.bookmark),onPressed: () {
            context.push("/bookmarkedJobs");
          },),)],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Remotely', style: AppTextStyles.heading),
          Text(
            'Jobs for you',
            style: AppTextStyles.subHeading.copyWith(
              decoration: TextDecoration.underline,
            ),    
      ),    
    ],    
  ), 
),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<JobBloc, JobState>(
                  builder: (BuildContext context, state) {
                    return state.whenOrNull(
                      initial: () => const SizedBox.shrink(),
                      loading: () => ListView.builder(
                        itemBuilder: (context, index) =>
                            LoadingJobListPage(),
                        itemCount: 10,
                      ),
                      success: (jobs) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),

                          SizedBox(
                            height: 45,
                            child: CustomTextField(
                              onchanged: (value) {
                                 if (_debounce?.isActive ?? false) _debounce!.cancel();

  _debounce = Timer(const Duration(milliseconds: 500), () {
    context.read<JobBloc>().add(JobEvent.searchJob(value.trim()));
  });
                              },
                              
                              controller: _searchController,hintText: 'Search', )),

                            const SizedBox(height: 10),

                            Expanded(
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  _searchController.clear();
                                  context
                                      .read<JobBloc>()
                                      .add(JobEvent.fetchJobs());       
                                },
                                child: ListView.separated(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 10),
                                  itemCount: jobs.length,
                                  itemBuilder: (context, index) {
                                    final job = jobs[index];
                                    return GestureDetector(
                                      onTap: () {
                                        context.push("/jobDetails",
                                            extra: job);
                                      },
                                      child: jobCard(job),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      error: (message) => Text('Error: $message'),
                    ) ??
                        const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      
      ),
    );
  }

  Card jobCard(JobEntity job) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Expanded(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(job.title, style: AppTextStyles.heading),
              Text(job.companyName, style: AppTextStyles.body),
              Text(job.location, style: AppTextStyles.body),
              Text(job.jobType, style: AppTextStyles.body),
              Text(job.salary, style: AppTextStyles.body),
            ],
                    ),
                  
          ),
            IconButton(onPressed: () {
                      context.read<JobBloc>().add(JobEvent.bookMarkJobs(job));
                    }, icon: job.isBookMarked! ? Icon(Icons.bookmark):Icon(Icons.bookmark_add_outlined))
      
        ],)
      ),
    );
  }


}