import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:remotely/core/local_storage/secure_storage/secure_storage.dart';
import 'package:remotely/features/auth/presentation/ui/auth_screen.dart';
import 'package:remotely/features/bookmarkedJobs/presenatation/bloc/bloc/bookmark_bloc.dart';
import 'package:remotely/features/bookmarkedJobs/presenatation/bloc/event/bookmark_event.dart';
import 'package:remotely/features/bookmarkedJobs/presenatation/screeen/bookmarked_jobs.dart';
import 'package:remotely/features/home/domain/entities/jobs_entities.dart';
import 'package:remotely/features/home/presentation/bloc/event/job_event.dart';
import 'package:remotely/features/home/presentation/bloc/job_bloc.dart';
import 'package:remotely/features/home/presentation/ui/job_details.dart';
import 'package:remotely/features/home/presentation/ui/job_listing.dart';
import 'package:remotely/routes/route_animation.dart';

class AppRoutes{


static final SecureStorageHelper _secureStorageHelper = SecureStorageHelper.instance; 


  static  GoRouter router = GoRouter(

    initialLocation: '/',
    redirect: (context, state) async{
      final String token = await _secureStorageHelper.getToken()??'';
      final isLoggedIn = token.isNotEmpty;
      final isGoingToAuth = state.matchedLocation == '/';
      if (isLoggedIn && isGoingToAuth) {
        return '/joblist';
      }

      // Logged in nahi hai aur job listing pe jaane ki koshish kar raha hai → auth pe bhej do
      if (!isLoggedIn && !isGoingToAuth) {
        return '/';
      }

      return null; 
    },

    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          
           return AppTransitions.buildTransitionPage(
      state: state,
      child: AuthScreen(),
    );
        },
      ),

      GoRoute(
        path:'/joblist',
        pageBuilder: (context, state) {

        return AppTransitions.buildTransitionPage(
      state: state,
      child: JobListing(),
    );

        },
      ),

      GoRoute(path: '/jobDetails',
      
      pageBuilder: (context, state) {
        return AppTransitions.buildTransitionPage(state: state, child: JobDetails(job: state.extra as JobEntity,));
      },
      ),

      GoRoute(path: '/bookmarkedJobs',
      
      pageBuilder: (context, state) {

        context.read<BookmarkBloc>().add(BookMarkEvent.fetchBookMarkedJobs());
        return AppTransitions.buildTransitionPage(state: state, child: BookmarkedJobs());
      },
      )


    ],
  );
}