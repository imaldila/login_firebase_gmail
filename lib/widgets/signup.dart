import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/google_sign_in.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlutterLogo(
            size: 150,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text('Welcome Back'),
          const Text('Login to continue the journey'),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  minimumSize: const Size(double.infinity, 50)),
              icon: const FaIcon(FontAwesomeIcons.google),
              onPressed: () {
                context.read<GoogleSignInProvider>().googleLogin();
              },
              label: const Text('Login with Google'),
            ),
          ),
        ],
      ),
    );
  }
}
