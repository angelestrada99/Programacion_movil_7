import 'package:firebase_auth/firebase_auth.dart';

class EmailAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user!.sendEmailVerification();
      print('Datos del usuario registrado: ${userCredential.user}');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Passsword muy debil (7 caracteres es lo ideal)');
      } else if (e.code == 'email-already-in-use') {
        print('Esta cuenta ya esta actualmente registrada');
      }
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    print("ESTE ES EL EMAIL!!: " + email);
    print("ESTE ES EL PASSWORD!!: " + password);
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      print('User logged in: ${userCredential.user}');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Ningun usuario registrado con esta direccion de correo');
      } else if (e.code == 'wrong-password') {
        print(
            'La contrasena no coincide con el usuario que usted esta indicando');
      }
      return false;
    }
  }
}
