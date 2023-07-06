import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../admin/adddoctor/admin.dart';
import '../../view/home/home_screen.dart';
import '../../view/login_and_sign_up/login_and_signup.dart';

class AuthProvider with ChangeNotifier {
  GoogleSignInAccount? _user;
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount get user => _user!;
  final FirebaseAuth _fb;
  AuthProvider(this._fb);
  bool isLoading = false;
  bool isLoadingReset = false;
  bool isSignUploding = false;
  bool isGoogleLoding = false;
  Stream<User?> stream() => _fb.authStateChanges();
  bool get loading => isLoading;

  bool get signUploding => isSignUploding;

  //-----------------Sign in function--------------------------//
  Future signIn(String email, String password, BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      await _fb
          .signInWithEmailAndPassword(
            email: email.trim().toLowerCase(),
            password: password.trim(),
          )
          .then(
            (value) => {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(),
                ),
                (route) => false,
              ),
            },
          );
      isLoading = false;
      notifyListeners();
      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      isLoading = false;
      notifyListeners();
      return Future.value(ex.message);
    }
  }

  //-----------------------------SigUp function-------------------//

  Future signUp(String email, String password, BuildContext context) async {
    try {
      isGoogleLoding = true;
      notifyListeners();
      await _fb
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then(
            (value) => {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const AdminHomePage(),
                ),
                (route) => false,
              ),
            },
          );

      isGoogleLoding = false;
      notifyListeners();
      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      isGoogleLoding = false;
      notifyListeners();
      log(ex.message!);
      log(ex.toString());
      return Future.value(ex.message);
    }
  }

  Future googleLoigin(BuildContext context) async {
    try {
      isGoogleLoding = true;
      notifyListeners();
      final isLogged = await GoogleSignIn().isSignedIn();
      if (isLogged) GoogleSignIn().signOut();
      final result = await GoogleSignIn().signIn();
      if (result == null) {
        isGoogleLoding = false;
        notifyListeners();
        return Future.value('Occured an error while sign in.');
      }
      final cred = await result.authentication;
      final exists = await _fb.fetchSignInMethodsForEmail(result.email);
      if (exists.isEmpty) {
        // isGoogleLoding = false;
        notifyListeners();
        return Future.value('User Dose Not exist  !');
      }
      await _fb
          .signInWithCredential(GoogleAuthProvider.credential(
              accessToken: cred.accessToken, idToken: cred.idToken))
          .then(
            (value) => {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(),
                ),
                (route) => false,
              ),
            },
          );
      isGoogleLoding = false;
      notifyListeners();
      return Future.value('');
      // Use the authentication token to sign in the user to  app's backend server
    } on FirebaseAuthException catch (ex) {
      isGoogleLoding = false;
      notifyListeners();
      return Future.value(ex.message);
    }
  }

  Future googleSigUp(BuildContext context) async {
    try {
      isSignUploding = true;
      notifyListeners();
      final isLogged = await GoogleSignIn().isSignedIn();
      if (isLogged) GoogleSignIn().signOut();
      final result = await GoogleSignIn().signIn();
      if (result == null) {
        isSignUploding = false;
        notifyListeners();
        return Future.value('Occured an error while sign in.');
      }
      final cred = await result.authentication;
      final exists = await _fb.fetchSignInMethodsForEmail(result.email);
      if (exists.isNotEmpty) {
        isSignUploding = false;
        notifyListeners();
        return Future.value('User Dose Not exist  !.');
      }
      await _fb
          .signInWithCredential(GoogleAuthProvider.credential(
              accessToken: cred.accessToken, idToken: cred.idToken))
          .then(
            (value) => {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const AdminHomePage(),
                ),
                (route) => false,
              ),
            },
          );
      isSignUploding = false;
      notifyListeners();
      return Future.value('');
      // Use the authentication token to sign in the user to  app's backend server
    } on FirebaseAuthException catch (ex) {
      isSignUploding = false;
      notifyListeners();
      return Future.value(ex.message);
    }
  }

  OverlaySupportEntry erorr(msg) {
    return showOverlayNotification((context) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: SafeArea(
          child: ListTile(
            leading: SizedBox.fromSize(
              size: const Size(40, 40),
              child: ClipOval(
                child: Container(
                  color: Colors.black,
                  child: const Center(
                    child: Icon(
                      Icons.error_outline_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(msg ?? "Somthing! went to the wrong"),
            //subtitle: const Text('Thanks for checking out my tutorial'),
            trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  OverlaySupportEntry.of(context)?.dismiss();
                }),
          ),
        ),
      );
    }, duration: const Duration(seconds: 1));
  }

  Future<void> signOut(BuildContext context) async {
    await _fb.signOut().then(
          (value) => {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const LoginAndSignUp(),
              ),
              (route) => false,
            ),
          },
        );
  }

  //-------reset Password------------------------------------------------//

  Future restPassword(BuildContext context, String email) async {
    try {
      isLoadingReset = true;
      notifyListeners();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      var snackBar = const SnackBar(content: Text('please check your email'));
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      isLoadingReset = false;
      notifyListeners();
    } on FirebaseAuthException catch (ex) {
      isLoadingReset = false;
      notifyListeners();
      return Future.value(ex.message);
    }
  }
  //****************************************************************
}
