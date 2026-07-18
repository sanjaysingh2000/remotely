import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remotely/core/theme/app_theme.dart';
import 'package:remotely/core/validations/validations.dart';
import 'package:remotely/core/widgets/custom_button.dart';
import 'package:remotely/core/widgets/custom_text_field.dart';
import 'package:remotely/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:remotely/features/auth/presentation/bloc/event/auth_event.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Login', style: AppTextStyles.heading,),
              CustomTextField(
                validator: (value) {
                 return Validators.email(value);
                },
                
                controller: _emailController),
              CustomTextField(
                 isObscure: true,
                validator: (value) {
                  return Validators.loginPassword(value);
                },
                controller: _passwordController
              ),
              CustomButton(label: 'Login', onPressed: () {
                if (_formKey.currentState?.validate() != true) {
                  return;
                }
                context.read<AuthBloc>().add(
                  AuthEvent.login(_emailController.text, _passwordController.text)
                );
              },
              ),

              RichText(text: TextSpan(
                children: [
                  TextSpan(text: "Don't have an account? ", style: AppTextStyles.body.copyWith(color:Colors.black )),
                  TextSpan(
                    text: "Sign up",
         style: AppTextStyles.body.copyWith(color:Colors.blue ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      if (!mounted) return;
                      context.read<AuthBloc>().add(AuthEvent.toggleAuthPage(true));
                    },
                  ),
               
               
                ],
              ), ),
            ],
          ),
    )
     
     ;
  }
}