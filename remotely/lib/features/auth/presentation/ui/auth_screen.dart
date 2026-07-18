import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:remotely/core/custom_snackbar/custom_snackbars.dart';
import 'package:remotely/core/theme/app_theme.dart';
import 'package:remotely/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:remotely/features/auth/presentation/bloc/state/auth_state.dart';
import 'package:remotely/features/auth/presentation/ui/widgets/login_form.dart';
import 'package:remotely/features/auth/presentation/ui/widgets/signup_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {


  bool showLOgin = true;

  void toggleForm(){
    
    setState(() {
      showLOgin = !showLOgin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: Text('Remotely', style: AppTextStyles.heading,),
      ),
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(

          listener: (context, state) {
            state.whenOrNull(
              authenticated:() => context.go('/joblist'),
              error:(message) => 
      
           
           

           AppSnackbar.failure(message),
            );
            },

          builder: (context, state) {
          return state.whenOrNull(
            toggleAuthPage: (isSignUp) => isSignUp ? SignupForm() : LoginForm(),
            initial: () =>  LoginForm() ,
            loading: () => Center(child: CircularProgressIndicator()),
            authenticated: () => Center(child: Text('Authenticated')),
            error: (message) => showLOgin ? LoginForm() : SignupForm(),
          ) ?? SizedBox.shrink();
          },
        )
     
      )
      ),
    );
  }
}