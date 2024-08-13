import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app_2/models/users.dart';

//send password reset email to the user and delete the user from the local database
///
//parametes :
// - userEmail : the email of the user
ForgetPasswordController(String userEmail) async{
var db = await openUserDatabase();
var auth = FirebaseAuth.instance;
await auth.sendPasswordResetEmail(email: userEmail);
try {
    int count = await db.delete(
      'users',
      where: 'email = ?',
      whereArgs: [userEmail],
    );
    if (count > 0) {
      print("User with email $userEmail deleted from the local database.");
    } else {
      print("No user found with email $userEmail in the local database.");
    }
    } catch (e) {
      print("error deleting user from local database $e");
      }
}