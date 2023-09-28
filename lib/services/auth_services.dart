import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  signInWithGoogle() async {
    //tương tác quá trình đăng nhập
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    //đăng nhập
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
