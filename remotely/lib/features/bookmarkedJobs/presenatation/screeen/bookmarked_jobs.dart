
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:remotely/core/theme/app_theme.dart';
import 'package:remotely/features/bookmarkedJobs/presenatation/bloc/bloc/bookmark_bloc.dart';
import 'package:remotely/features/bookmarkedJobs/presenatation/bloc/event/bookmark_event.dart';
import 'package:remotely/features/bookmarkedJobs/presenatation/bloc/state/bookmark_state.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';
import 'package:remotely/features/home/presentation/bloc/event/job_event.dart';
import 'package:remotely/features/home/presentation/bloc/job_bloc.dart';

class BookmarkedJobs extends StatelessWidget {
  const BookmarkedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
          title: Text('Saved Jobs', style: AppTextStyles.heading,),
        
      ),
    body: SafeArea(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
        Expanded(
          child: BlocBuilder<BookmarkBloc, BookMarkState>(
            builder: (context, state) {
              return state.whenOrNull(
                    intial: () => const SizedBox.shrink(),
                    bookmarkedJobs: (jobs) {
                      return ListView.builder(
                        itemCount: jobs.length,
                        itemBuilder: (context, index) {
                          final job = jobs[index];
                          return GestureDetector(
                            onTap: () {

                              print("--->>> $job");
                               context.push("/jobDetails",
                                            extra: job);
                            },
                            child: jobCard(job));
                        },
                      );
                    },
                  ) ??
                  const SizedBox.shrink(); // fallback (important)
            },
          ),
        ),
      ],
    ),
  ),
),
    );
  }
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

      
        ],)
      ),
    );
  }

