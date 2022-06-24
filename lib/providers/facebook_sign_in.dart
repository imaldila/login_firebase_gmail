import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class FacebookSignInProvider extends ChangeNotifier {
  final fbLogin = FacebookLogin();
  String? _sdkVersion;
  String? _email;
  String? _imageUrl;
  FacebookAccessToken? _token;
  FacebookAccessToken get token => _token!;
  FacebookUserProfile? _profile;
  FacebookUserProfile get profile => _profile!;

  Future signInFB() async {
    await fbLogin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    // final String token = result.accessToken!.token;
    if (_token != null) {
      _profile = await fbLogin.getUserProfile();
      if (token.permissions.contains(FacebookPermission.email.name)) {
        _email = await fbLogin.getUserEmail();
      }
      _imageUrl = await fbLogin.getProfileImageUrl(width: 100);
    }

    // final response = await http.get(Uri.parse(
    //     'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token'));
    // final profile = jsonDecode(response.body);
    // print('profile: $profile');

    // await FirebaseAuth.instance.signInWithCredential(profile);
    notifyListeners();
  }
}
