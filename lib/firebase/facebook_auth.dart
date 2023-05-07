import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class FacebookAuth {
  static Future<User?> iniciarSesion({required BuildContext context}) async {
    FirebaseAuth objAuthenticator = FirebaseAuth.instance;
    User? user;

    FacebookLogin objFacebookSignIn = new FacebookLogin();
    FacebookLoginResult objFacebookSignInAccount =
        await objFacebookSignIn.logIn(customPermissions: ['email']);

    if (objFacebookSignInAccount != null) {
      FacebookAccessToken? objAccessToken =
          objFacebookSignInAccount.accessToken;
      AuthCredential objCredential =
          FacebookAuthProvider.credential(objAccessToken!.token);
      try {
        UserCredential objUserCredential =
            await FirebaseAuth.instance.signInWithCredential(objCredential);
        user = objUserCredential.user;
        return user;
      } on FirebaseAuthException catch (e) {
        print("Error en la autenticación con los servidores de MetaFB");
      }
    }
  }
}
