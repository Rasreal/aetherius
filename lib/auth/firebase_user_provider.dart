import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AetheriusCloudFirebaseUser {
  AetheriusCloudFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

AetheriusCloudFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AetheriusCloudFirebaseUser> aetheriusCloudFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AetheriusCloudFirebaseUser>(
      (user) {
        currentUser = AetheriusCloudFirebaseUser(user);
        return currentUser!;
      },
    );
