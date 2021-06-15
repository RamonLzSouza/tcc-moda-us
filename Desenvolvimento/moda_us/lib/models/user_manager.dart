import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:moda_us/helpers/firebase_erros.dart';
import 'package:moda_us/models/user.dart';

class UserManager {

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn({User user, Function onFail, Function onSucess}) async {
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      onSucess();
    } on PlatformException catch (e){
      onFail(getErrorString(e.code));
    }
  }

}