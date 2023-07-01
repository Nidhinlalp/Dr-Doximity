import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../db_functions/auth/auth.dart';
import '../sign_in_page/widgets/sign_in_page_email_textformfeild.dart';
import '../sign_in_page/widgets/sign_page_password_textformfeild.dart';
import '../sign_in_page/widgets/sign_up_butto.dart';
import '../sign_in_page/widgets/sing_button.dart';
import 'widgets/sign_up_quts.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  signUp(AuthProvider provider, BuildContext context) async {
    final msg = await provider.signUp(
        SingInPageEmailTextFormFeild.emalilControler.text,
        SingInPagePasswordTextFormFeild.passWordControler.text,
        context);
    if (msg == '') return;
    {
      if (context.mounted) {
        context.read<AuthProvider>().erorr(msg);
      }
    }
  }

  // googleSignUp(AuthProvider provider, BuildContext context) async {
  //   final msg = await provider.googleSigUp(context);
  //   if (msg == '') return;
  //   {
  //     if (context.mounted) {
  //       context.read<AuthProvider>().erorr(msg);
  //     }
  //   }
  // }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthProvider>();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 150),
              FadeInDown(child: const SignUpPageQuts()),
              const SizedBox(height: 30),
              // FadeInDown(
              //   child: SignGoogleButton(
              //     onPressed: () {
              //       //googleSignUp(authProvider, context);
              //     },
              //   ),
              // ),
              const SizedBox(height: 50),
              // const SignUpUsernameTextfield(),
              const SizedBox(height: 30),
              FadeInUp(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: SingInPageEmailTextFormFeild(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: SingInPagePasswordTextFormFeild(),
                    ),
                    const SizedBox(height: 50),
                    context.watch<AuthProvider>().isGoogleLoding
                        ? const CircularProgressIndicator(
                            color: Colors.black,
                          )
                        : SingInButton(
                            name: 'Sign Up',
                            onPressed: () {
                              signUp(authProvider, context);
                            },
                            formKey: _formKey,
                          ),
                    const SizedBox(height: 30),
                    const SignUpButton(
                      lastText: 'Have an account?',
                      textButton: 'Log in',
                      isSignUp: false,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
