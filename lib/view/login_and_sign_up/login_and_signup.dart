import 'package:dr_doximity/view/auth/sign_in_page/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../db_functions/auth/auth.dart';

class LoginAndSignUp extends StatelessWidget {
  const LoginAndSignUp({super.key});
  googleSignIn(BuildContext context) async {
    final msg = await context.read<AuthProvider>().googleLoigin(context);
    if (msg == '') return;
    {
      if (context.mounted) {
        context.read<AuthProvider>().erorr(msg);
      }
    }
  }

  googleSignUp(BuildContext context) async {
    final msg = await context.read<AuthProvider>().googleSigUp(context);
    if (msg == '') return;
    {
      if (context.mounted) {
        context.read<AuthProvider>().erorr(msg);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset('assets/icons/Doctors-images.png'),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(),
                        ),
                        (route) => false);
                  },
                  child: Text('Connect'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
