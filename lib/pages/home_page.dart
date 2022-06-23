import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/widgets/loggin.dart';
import 'package:google_signin/widgets/signup.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // return const SignUpWidget();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return LogginWidget();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else {
            return const SignUpWidget();
          }
        },
      ),
    );
  }
}
