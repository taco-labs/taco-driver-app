import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TacoDriverFirebaseUser {
  TacoDriverFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

TacoDriverFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TacoDriverFirebaseUser> tacoDriverFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TacoDriverFirebaseUser>(
      (user) {
        currentUser = TacoDriverFirebaseUser(user);
        return currentUser!;
      },
    );
