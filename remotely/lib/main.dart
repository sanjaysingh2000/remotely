import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remotely/core/custom_snackbar/custom_snackbars.dart';
import 'package:remotely/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:remotely/features/bookmarkedJobs/presenatation/bloc/bloc/bookmark_bloc.dart';
import 'package:remotely/features/home/domain/usecases/auth_use_cases.dart';
import 'package:remotely/features/home/presentation/bloc/job_bloc.dart';
import 'package:remotely/routes/app_routes.dart';
import 'package:remotely/di/di.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<JobBloc>(
          create: (context) => JobBloc(jobUseCase: di.getIt<JobUseCases>()),
        ),
        BlocProvider(create: (context) => BookmarkBloc(di.getIt()),)
      ],
      child: MaterialApp.router(
        scaffoldMessengerKey: snackbarKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
          ),
          textTheme: GoogleFonts.outfitTextTheme(),
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: AppRoutes.router,
        // home: const AuthScreen(),
      ),
    );
  }
}
