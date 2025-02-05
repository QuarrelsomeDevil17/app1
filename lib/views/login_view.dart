// ignore_for_file: unused_import

import 'package:app1/constants/routes.dart';
import 'package:app1/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:developer' as devtools show log;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            decoration: const InputDecoration(
                labelText: 'Email', hintText: 'Enter your email'),
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: _password,
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
            autocorrect: false,
            enableSuggestions: false,
            obscureText: true,
          ),
          TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    notesRoute,
                    (route) => false,
                  );
                } on FirebaseAuthException catch (e) {
                  devtools.log(e.toString());
                  if (e.code == 'user-not-found' ||
                      e.code == 'The email address is badly formatted') {
                    devtools.log('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    devtools.log('Wrong password provided for that user.');
                    devtools.log(e.code);
                  }
                }
              },
              child: const Text('Login')),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('New user? Register Here! '),
          )
        ],
      ),
    );
  }
}
