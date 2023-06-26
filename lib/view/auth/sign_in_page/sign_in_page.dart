import 'package:animate_do/animate_do.dart';
import 'package:dr_doximity/view/auth/sign_in_page/widgets/sign_in_page_email_textformfeild.dart';
import 'package:dr_doximity/view/auth/sign_in_page/widgets/sign_or_section.dart';
import 'package:dr_doximity/view/auth/sign_in_page/widgets/sign_page_forgot_password_botton.dart';
import 'package:dr_doximity/view/auth/sign_in_page/widgets/sign_page_password_textformfeild.dart';
import 'package:dr_doximity/view/auth/sign_in_page/widgets/sign_page_quts.dart';
import 'package:dr_doximity/view/auth/sign_in_page/widgets/sign_page_sethescope_image.dart';
import 'package:dr_doximity/view/auth/sign_in_page/widgets/sign_up_butto.dart';
import 'package:dr_doximity/view/auth/sign_in_page/widgets/sing_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../db_functions/auth/auth.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final emailController = TextEditingController();

  signIn(AuthProvider provider, BuildContext context) async {
    final msg = await provider.signIn(
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

  // googleSignIn(AuthProvider provider, BuildContext context) async {
  //   final msg = await provider.googleLoigin(context);
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  FadeInDown(
                    child: const SingPageSethesCopeImage(
                        image: 'assets/images/Doctors-equipment.png'),
                  ),
                  const SizedBox(height: 10),
                  FadeInLeft(child: const SingInPageQuts()),
                  const SizedBox(height: 30),
                  FadeInUp(
                    child: SingInPageEmailTextFormFeild(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some Your Email.....!';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInUp(child: const SingInPagePasswordTextFormFeild()),
                  const SizedBox(height: 10),
                  FadeInUp(child: const SingInForgetPasswordTextBuotton()),
                  const SizedBox(height: 10),
                  FadeInRight(
                    child: Column(
                      children: [
                        SingInButton(
                          name: 'Sign In',
                          onPressed: () => signIn(authProvider, context),
                          formKey: _formKey,
                        ),
                        const SizedBox(height: 30),
                        const SignInOrSection(),
                        const SizedBox(height: 30),
                        // SignGoogleButton(
                        //   onPressed: () {
                        //     // googleSignIn(authProvider, context);
                        //   },
                        // ),
                        const SizedBox(height: 30),
                        const SignUpButton(
                          isSignUp: true,
                          lastText: 'Dont have an account?',
                          textButton: 'Sign Up',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
