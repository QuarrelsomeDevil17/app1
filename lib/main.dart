// ignore_for_file: avoid_print

import 'package:app1/views/login_view.dart';
import 'package:app1/views/register_view.dart';
import 'package:app1/views/verify_emails-view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: false,
        ),
        home: const HomePage(),
        routes: {
          '/login/': (context) => const LoginView(),
          '/register/': (context) => const RegisterView(),
        }),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                print('Email verified: ${user.emailVerified}');
              } else {
                return const VerifyEmailView();
              }
            } else {
                return const LoginView();
              
            }
            return const Text('Done');
            
          default:
            return const CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}
