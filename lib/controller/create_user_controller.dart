import 'package:firebase_auth/firebase_auth.dart';

///signup new user to firebase auth
///
///parametes :
/// - userEmail : the email of the user
/// - userPassword : the password of the user
///
///return : 
/// - 1 : success
/// - 0 : weak password
/// - -1 : email already in use
/// - -2 : any other error
rigesterUser(String userEmail,String userPassword)async{
try {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: userEmail,
    password: userPassword
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    return 0;
  } else if (e.code == 'email-already-in-use') {
    return -1;
  }
} catch (e) {
    return -2;
}
return 1;
}