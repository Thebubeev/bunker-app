import 'package:bunker_app/Services/DatabaseManager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
      );

  // Email & Password Sign Up
  Future<String> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    // Update the username
    var userUpdate = UserUpdateInfo();
    userUpdate.displayName = name;
    await currentUser.updateProfile(userUpdate);
    await currentUser.reload();
    await DatabaseManager().createUserData(
        name, null, null, null, null, null, null, null, null, currentUser.uid);
    return currentUser.uid;
  }

  Future<String> getCurrentUserUid() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  Future sendPasswordResetEmail(String email) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // Email & Password Sign In
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .uid;
  }

  // Sign Out
  signOut() {
    return _firebaseAuth.signOut();
  }
}
