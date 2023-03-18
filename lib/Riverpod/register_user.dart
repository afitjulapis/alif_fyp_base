import 'package:firebase_auth/firebase_auth.dart';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> createNewUser(String email,String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = userCredential.user!.uid;
      print('New user created with uid: $uid');
      return uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return e.message;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return e.message;
      }
      
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  Future<String> signInWithEmailAndPassword(
    String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'true';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return e.message.toString();
    }
  }