import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../db_functions/auth/auth.dart';
import '../../home/home_screen.dart';
import '../login_and_signup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: context.read<AuthProvider>().stream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Someting Want Wrong'));
          } else if (snapshot.hasData) {
            return HomePage();
          } else {
            return const LoginAndSignUp();
          }
        },
      ),
    );
  }
}
