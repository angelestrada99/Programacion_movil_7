import 'package:firebase_auth/firebase_auth.dart';

class EmailAuth {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<?> createUserWithEmailAndPassword({
    required String email,
    required String password
  }) async{
    try {
      final UserCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      UserCredential.user.sendEmailVerification();
      return true;
    } catch (e) {
      return false; 
    }   
  }
  Future<bool> signWithEmailandPassword({
    required String email,
    required String password
  })async{
    try {
      final userCredential = await _auth.signWithEmailandPassword(email: email, password: password);
      if(userCredential.user!.emailVerified){
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
 