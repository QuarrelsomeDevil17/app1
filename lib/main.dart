// ignore_for_file: avoid_print

import 'package:app1/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      // This is the theme of your application.

      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: false,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              print('current user is .......');
              final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                print('user is verified');
              } else {
                print('user is not verified');
              }
              return const Text('done!!');
            default:
              return const Text('Loading..|...');
          }
        },
      ),
    );
  }
}
