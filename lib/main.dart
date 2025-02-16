import 'package:app1/constants/routes.dart';
import 'package:app1/services/auth/auth_service.dart';
import 'package:app1/views/home_page.dart';
import 'package:app1/views/login_view.dart';
import 'package:app1/views/notes_view.dart';
import 'package:app1/views/register_view.dart';
import 'package:app1/views/verify_emails-view.dart';
import 'package:flutter/material.dart';

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
          loginRoute: (context) => const LoginView(),
          registerRoute: (context) => const RegisterView(),
          notesRoute: (context) => const NotesView(),
          verifyEmailRoute: (context) => const VerifyEmailView(),
          homePageRoute: (context) => const HomePage(),
        }),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const NotesView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const HomeBage();
            }

          default:
            return const CircularProgressIndicator.adaptive();
        }
      }, // bildr
    );
  }
}
