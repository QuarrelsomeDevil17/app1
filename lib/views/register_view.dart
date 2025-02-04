import 'package:app1/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
          title: const Text('Register'),
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
                  labelText: 'Password', hintText: 'Enter your password'),
              autocorrect: false,
              enableSuggestions: false,
              obscureText: true,
            ),
            TextButton(
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;

                  try {
                    final userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password);
                    print(userCredential);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('weak password');
                    } else if (e.code == 'email-already-in-use') {
                      print('Already registered');
                    } else if (e.code == 'invalid-email') {
                      print('Invalid email');
                    } else {
                      print('Error $e');
                    }
                  }
                },
                child: const Text('Register')),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(
                      '/login/', 
                      (route) => true);
              },
              child: const Text('Already Registered. Login Here !'),
            )
          ],
        ));
  }
}
