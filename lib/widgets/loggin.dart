import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/providers/google_sign_in.dart';
import 'package:provider/provider.dart';

class LogginWidget extends StatelessWidget {
  LogginWidget({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged In'),
        actions: [
          TextButton(
            onPressed: () {
              context.read<GoogleSignInProvider>().googleLogout();
              print('test');
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Profile',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 16,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Name ${user.displayName}',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Name ${user.email}',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
