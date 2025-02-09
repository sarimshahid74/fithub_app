import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Google Sign-In Method
  Future<String> signInWithGoogle() async {
    String res = "Some error occurred";
    try {
      if (_auth.currentUser != null) {
        await logoutUser();
      }

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential = await _auth.signInWithCredential(credential);

        await _firestore.collection("users").doc(userCredential.user!.uid).set({
          'name': userCredential.user!.displayName ?? '',
          'email': userCredential.user!.email ?? '',
          'uid': userCredential.user!.uid,
        }, SetOptions(merge: true));

        res = "Successfully signed in with Google";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // Sign-Up Method
  Future<String> signupUser({
    required String email,
    required String password,
    required String name,
  }) async {
    String res = "Some error occurred";
    try {
      if (_auth.currentUser != null) {
        await logoutUser();
      }

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'uid': userCredential.user!.uid,
      }, SetOptions(merge: true));

      res = "Sign-up successful";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // Login Method
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (_auth.currentUser != null) {
        await logoutUser();
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      await _firestore.collection("users").doc(userCredential.user!.uid).update({
        'lastLogin': FieldValue.serverTimestamp(),
      });

      res = "Successfully logged in";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // Reset Password Method
  Future<String> resetPassword(String email) async {
    String res = "Some error occurred";
    try {
      await _auth.sendPasswordResetEmail(email: email);
      res = "Password reset email sent";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // Logout Method
  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      // ignore: avoid_print
      print("Error logging out: $e");
    }
  }
}
