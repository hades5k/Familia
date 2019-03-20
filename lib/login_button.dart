import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './auth.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authService.user,
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Signout'),
              onPressed: () => authService.signOut(),
            );
          } else {
            return MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Login with Google'),
              onPressed: () => authService.googleSignIn(),
            );
          }
        });
  }
}
