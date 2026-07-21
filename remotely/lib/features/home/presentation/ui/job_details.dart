import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:remotely/core/theme/app_theme.dart';
import 'package:remotely/features/home/data/models/jobs_response.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';
import 'package:remotely/features/home/presentation/ui/job_listing.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetails extends StatelessWidget {

  final JobEntity job;
  const JobDetails({super.key, required this.job});

  @override
  Widget build(BuildContext context) {

print('desc -->> ${job.description}');

    return Scaffold(
      appBar: AppBar(
      title: Text('Job Detail', style: AppTextStyles.heading,),
        ),
      body: SafeArea(child:
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16.0),
         child: SingleChildScrollView(
           child: Column(    
            spacing: 6,
            children: [
              jobSummary(job),              
              Card(
                color: Colors.white,
                child: Html(data: job.description,
               onLinkTap: (url, attributes, element) async {
                if (url == null) return;
          
                final uri = Uri.parse(url);
          
                if (await canLaunchUrl(uri)) {
                  await launchUrl(
                    uri,
                    mode: LaunchMode.externalApplication,
                  );
                } else {
                  debugPrint('Could not launch $url');
                }
                 },
              ),)
            ],
                 ),
         ),
       )),
    );
  }
}


  Widget jobSummary(JobEntity job) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              
              Text(job.title, style:AppTextStyles.heading,),
              Text(job.companyName,style:AppTextStyles.body,),
              Text(job.location,style:AppTextStyles.body,),
              Text(job.jobType,style:AppTextStyles.body,),
              Text(job.salary,style:AppTextStyles.body,),
                   ],
          ),
        ),
      ),
    );
  }
