import 'package:dr_doximity/view/login_and_sign_up/cheking.dart';
import 'package:dr_doximity/viewmodel/bootom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'db_functions/accepted/accepting.dart';
import 'db_functions/auth/auth.dart';
import 'db_functions/crud.dart';
import 'db_functions/hostory/user_history.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

// ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Crud(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(FirebaseAuth.instance),
          child: StreamProvider(
            create: (context) => context.watch<AuthProvider>().stream(),
            initialData: null,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => Accepting(),
        ),
        ChangeNotifierProvider(
          create: (context) => BotomNav(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserHistory(),
        ),
      ],
      child: OverlaySupport.global(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
