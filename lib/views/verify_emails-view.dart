import 'package:app1/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Center(
          child: Column(
            children: [
              Text('Verification Email already sent, please check your email'),
              Text('If you did not receive the email, please click the button below'),
              TextButton(
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  await user?.sendEmailVerification();
                },
                child: const Text('Send verification mail'),
              ),
              TextButton(
                onPressed: () async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (_) => false);
                },
                child: const Text('Back to Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
