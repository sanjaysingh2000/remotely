import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingJobListPage extends StatefulWidget {
  const LoadingJobListPage({super.key});

  @override
  State<LoadingJobListPage> createState() => _LoadingJobListPageState();
}

class _LoadingJobListPageState extends State<LoadingJobListPage> {

  @override
  Widget build(BuildContext context) {
     return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: JobCardShimmer()      
          )
          );
  }
}

  Card JobCardShimmer() {
  return Card(
    elevation: 4,
    margin: const EdgeInsets.all(12),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Title
          Container(
            height: 16,
            width: double.infinity,
            color: Colors.white,
          ),

          const SizedBox(height: 10),

          // Subtitle
          Container(
            height: 14,
            width: 200,
            color: Colors.white,
          ),

          const SizedBox(height: 10),

          // Description lines
          Container(
            height: 12,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          Container(
            height: 12,
            width: double.infinity,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );

  }
