import 'package:firebase_auth/firebase_auth.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app_2/controller/hash_password_controller.dart';
import 'package:weather_app_2/models/users.dart';
///signup new user to local database (sql light)
///
///parameters :
/// - email : the email of the user
/// - password : the password of the user
/// 
/// return :
/// - true : success
/// - false : any other error
Future<bool> localSignup(String email, String password) async {
  final db = await openUserDatabase();
  String hashedPassword = hsashedPassword(password);
  try {
    await db.insert(
      'users',
      {
        'email': email,
        'password': hashedPassword,
        'token': '',
      },
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
    print("Local signup successful");
    return true;
  } catch (e) {
    print("local error : $e");
    return false;
  }
}

///signup new user to firebase auth
///
///parameters :
/// - email : the email of the user
/// - password : the password of the user
/// 
///return :
/// - true : success
/// - false : any other error
Future<bool> remoteSignup(String email, String password) async {
  final auth = FirebaseAuth.instance;
  try {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    print("Remote signup successful");
    return true;
  } catch (e) {
    print("remote error : $e");
    return false;
  }
}

///signup new user to local and remote databases
///
///parameters :
/// - email : the email of the user
/// - password : the password of the user
///
/// return :
/// - true : success
/// - false : any other error
Future<bool> SignupController(String email, String password) async {
  try{
    await localSignup(email, password);
    await remoteSignup(email, password);
    return true;
  }catch(e){
    print("error $e");
    return false;
  }
}