import 'package:uuid/uuid.dart';
import 'package:weather_app_2/models/users.dart';

///generate a random token
///
///return : the generated token
String generateToken() {
  var uuid = Uuid();
  return uuid.v4();
}

///check if the token is in the local database
///
///parameters :
/// - token : the token to be checked
///
///return :
/// - true : if the token is in the local database
/// - false : if the token is not in the local database
Future<bool> checkLocalToken(String token) async {
  final db = await openUserDatabase();

  final List<Map<String, dynamic>> maps = await db.query(
    'users',
    where: 'token = ?',
    whereArgs: [token],
  );
  if (maps.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

