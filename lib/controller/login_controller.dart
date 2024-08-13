import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_2/controller/hash_password_controller.dart';
import 'package:weather_app_2/controller/tokens_controller.dart';
import 'package:weather_app_2/models/users.dart';

///login the user using the local database (sql light)
///
///parameters :
/// - email : the email of the user
/// - password : the password of the user
///
///return :
/// - the token of the user if the login is successful
/// - 0 if the login is not successful
Future<String?> localLogin(String email, String password) async {
  SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  final db = await openUserDatabase();
  final List<Map<String, dynamic>> maps = await db.query(
    'users',
    columns: ['password', 'token'],
    where: 'email = ?',
    whereArgs: [email],
  );
  if (maps.isNotEmpty) {
    String storedHashedPassword = maps[0]['password'];
    if (checkpassword(password, storedHashedPassword)) {
      String token = generateToken();
      await db.update(
        'users',
        {'token': token},
        where: 'email = ?',
        whereArgs: [email],
      );
      print("Local login successful");
      print(token);
      prefs.setString('token', token);
      prefs.setString('storage', 'local');
      return token;
    } else {
      return '0';
    }
  } else {
    return '0';
  }
}

///login the user using the remote database (firebase)
///
///parameters :
/// - email : the email of the user
/// - password : the password of the user
/// 
/// return :
/// - the token of the user if the login is successful
/// - 0 if the login is not successful
Future<String?> remotelogin(String email, String password) async {
  final auth = FirebaseAuth.instance;
  SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    String? token = await auth.currentUser!.getIdToken();
    print(token);
    prefs.setString('token', token!);
    prefs.setString('storage', 'remote');
  } catch (e) {
    print(e);
    return "0";
  }
  print("Remote login successful");
  return prefs.getString('token');
}

///login the user
/// - decide if the login is local or remote
///
///parameters :
/// - email : the email of the user
/// - password : the password of the user
/// 
/// return :
/// - true if the login is successful
/// - false if the login is not successful
Future<bool> LoginController(String email, String password) async {
  String? token = await localLogin(email, password);
  if (token == '0') {
    token = await remotelogin(email, password);
    if (token == '0') {
      return false;
    } else {
      return true;
    }
  } else {
    return true;
  }
}
