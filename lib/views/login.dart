import 'package:flutter/material.dart';
import 'package:weather_app_2/controller/get_city_controller.dart';
import 'package:weather_app_2/controller/login_controller.dart';
import 'package:weather_app_2/views/forget_password.dart';
import 'package:weather_app_2/views/screen1.dart';
import 'package:weather_app_2/views/signup.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/Icon.png'),
                  width: 200,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  controller: emailController,
                ),
                SizedBox(
                  height: 32,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  controller: passwordController,
                ),
                SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      bool login = await LoginController(
                          emailController.text, passwordController.text);
                      if (login) {
                      var tempCity = await getcityController("cairo");
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen(
                                    city: tempCity,
                                    search: true,
                                  )));
                    }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text('Login'),
                ),
                SizedBox(
                  height: 32,
                ),
                Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  },
                  child: Text('Sign up'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassword()));
                    },
                    child: Text("Forget Password"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
