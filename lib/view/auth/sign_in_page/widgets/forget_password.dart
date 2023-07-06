import 'package:dr_doximity/view/auth/sign_in_page/widgets/sign_in_page_email_textformfeild.dart';
import 'package:dr_doximity/view/auth/sign_in_page/widgets/sign_page_sethescope_image.dart';
import 'package:dr_doximity/view/auth/sign_in_page/widgets/sing_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../db_functions/auth/auth.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  resetPassword(AuthProvider provider, BuildContext context) async {
    final msg = await provider.restPassword(
      context,
      SingInPageEmailTextFormFeild.emalilControler.text,
    );
    if (msg == '') return;
    {
      if (context.mounted) {
        context.read<AuthProvider>().erorr(msg);
      }
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthProvider>();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assets/icons/back-icon.png'),
        ),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const SingPageSethesCopeImage(
                  image: 'assets/images/Doctors-ForgetPassword-equipment.png',
                ),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Forget Password',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Enter your email address to get an OTP code\n to reset your password..',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SingInPageEmailTextFormFeild(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some Your Email.....!';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 50),
                context.watch<AuthProvider>().isLoadingReset
                    ? const CircularProgressIndicator()
                    : SingInButton(
                        name: 'Send me email',
                        onPressed: () {
                          resetPassword(authProvider, context);
                        },
                        formKey: _formKey,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
