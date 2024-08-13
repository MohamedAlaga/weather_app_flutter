import 'package:bcrypt/bcrypt.dart';
/// hash the password
/// 
/// parameters:
/// - password : the password to be hashed
/// 
/// return :
/// - the hashed password
String hsashedPassword(String password) {
  return BCrypt.hashpw(password, BCrypt.gensalt());
}
/// check the if the password is the same as the hashed password
/// 
/// parameters:
/// - password : the password to be checked
/// - hashedpassword : the hashed password
/// 
/// return :
/// - true : if the password is the same as the hashed password
bool checkpassword(String password, String hashedpassword) {
  return BCrypt.checkpw(password, hashedpassword);
}
